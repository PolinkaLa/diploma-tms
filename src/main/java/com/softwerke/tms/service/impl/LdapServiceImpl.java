package com.softwerke.tms.service.impl;

import com.softwerke.tms.model.Credential;
import com.softwerke.tms.service.LdapService;
import org.springframework.stereotype.Service;
import java.util.Hashtable;
import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;

/**
 softwerke\tmsapp
 ac8_yMp8ghv1eeZ
 ldap.fields_mapping=name=sAMAccountName,last_name=sn,first_name=givenName,fullname=displayName,email=mail,ldap_dn=dn
 */

@Service
public class LdapServiceImpl implements LdapService {
    private static String CONTEXT_FACTORY = "com.sun.jndi.ldap.LdapCtxFactory";
    private static String URL = "ldap://192.168.10.2:389";
    private static String SECURITY_AUTH = "Simple";
    private static String SECURITY_PRINCIPAL_POSTFIX = "ou=SBSUsers,ou=Users,ou=MyBusiness,dc=softwerke,dc=local";
    private static String SECURITY_PRINCIPAL_PREFIX = "cn=tmsapp";
    private static String SECURITY_PASS = "ac8_yMp8ghv1eeZ";
    private static String SEARCH_FILTER_ATTRIBUTE_NAME = "sAMAccountName";

    public String[] getUserData(String login) throws Exception {
        Hashtable<String, Object> lpv = new Hashtable<String, Object>();
        lpv.put(Context.INITIAL_CONTEXT_FACTORY, CONTEXT_FACTORY);
        lpv.put(Context.PROVIDER_URL, URL);
        lpv.put(Context.SECURITY_AUTHENTICATION, SECURITY_AUTH);
        lpv.put(Context.SECURITY_PRINCIPAL, SECURITY_PRINCIPAL_PREFIX + "," + SECURITY_PRINCIPAL_POSTFIX);
        lpv.put(Context.SECURITY_CREDENTIALS, SECURITY_PASS);

        // Create the initial context
        String accountName = null;
        String accountEmail = null;
        String[] accountData = {null, null};
        DirContext ctx;
        try {
            ctx = new InitialDirContext(lpv);
            String searchBase = SECURITY_PRINCIPAL_POSTFIX;
            StringBuilder searchFilter = new StringBuilder();
            searchFilter.append("(&(" + SEARCH_FILTER_ATTRIBUTE_NAME + "=");
            searchFilter.append(login);
            searchFilter.append("))");
            String returnAttrs[] = { "cn", "mail" };
            SearchControls sCtrl = new SearchControls();
            sCtrl.setSearchScope(SearchControls.SUBTREE_SCOPE);
            sCtrl.setReturningAttributes(returnAttrs);

            NamingEnumeration<SearchResult> answer = ctx.search(searchBase, searchFilter.toString(), sCtrl);
            // if no answer
            if (!answer.hasMore()) {
                throw new Exception("User didn't found : " + answer.toString());
            }
            if (answer.hasMore()) {
                SearchResult sr = answer.next();
                accountName = sr.getAttributes().get("cn").toString().replaceAll(":", "=");
                accountEmail = sr.getAttributes().get("mail").toString().replaceAll(":", "=");
            }
            // if more then 1 answer
            if (answer.hasMore()) {
                throw new Exception("Found two equal users : " + answer.toString());
            }
        } catch (NamingException e) {

        }
        if (accountName == null) {
            throw new Exception("Can't get user's attributes");
        }
        accountData[0] = accountName;
        accountData[1] = accountEmail;
        return accountData;
    }

//    public Credential authorizeUser(String login, String password) {
//        String[] accountData;
//        String accountLogin;
//        String accountEmail;
//        try {
//            accountData = getUserData(login);
//        } catch (Exception e) {
//            return null;
//        }
//        accountLogin = accountData[0];
//        accountEmail = accountData[1];
//        Hashtable<String, Object> env = new Hashtable<String, Object>();
//        env.put(Context.INITIAL_CONTEXT_FACTORY, CONTEXT_FACTORY);
//        env.put(Context.PROVIDER_URL, URL);
//        env.put(Context.SECURITY_AUTHENTICATION, SECURITY_AUTH);
//        env.put(Context.SECURITY_PRINCIPAL, accountLogin + "," + SECURITY_PRINCIPAL_POSTFIX);
//        env.put(Context.SECURITY_CREDENTIALS, password);
//
//        // Create the initial context
//        Credential credential = null;
//        try {
//            DirContext ctx = new InitialDirContext(env);
//            credential = new Credential(login, accountLogin, accountEmail);
//            return credential;
//        } catch (NamingException e) {
//
//            return credential;}
//    }

    /*
    * workflow for authorize user without VPN for developing*/
    public Credential authorizeUser(String login, String password) {
//        Credential credential = new Credential("lpv", "cn=Lappo Polina", "mail=polina.lappo@soft-werke.com");
        Credential credential = new Credential("lappoPolina", "cn=Lappo Polina", "mail=polina.lappo@soft-werke.com");
        return credential;
    }
}


