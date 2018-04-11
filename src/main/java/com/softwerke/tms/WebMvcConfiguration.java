package com.softwerke.tms;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.util.NestedServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Configuration
@EnableWebMvc
@ComponentScan("com.softwerke.tms")
public class WebMvcConfiguration extends WebMvcConfigurerAdapter {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/WEB-INF/resources/");
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addRedirectViewController("/", "/testpage")
                .setKeepQueryParams(true)
                .setStatusCode(HttpStatus.PERMANENT_REDIRECT);
    }

    @Bean
    public ViewResolver internalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/view/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(100000);
        return multipartResolver;
    }


    @Controller
    private static class ErrorController {
        private static final Logger LOGGER = LoggerFactory.getLogger(ErrorController.class);

        @RequestMapping("/error")
        public ModelAndView handleError(HttpServletRequest request, HttpServletResponse response) {

            Throwable throwable = (Throwable) request.getAttribute("javax.servlet.error.exception");
            if (throwable != null && !(throwable instanceof NestedServletException)) {
                LOGGER.error(throwable.getMessage(), throwable);
            }

            ModelAndView modelAndView = new ModelAndView("exception");
            modelAndView.addObject("errorMessage", HttpStatus.valueOf(response.getStatus()).getReasonPhrase());
            modelAndView.addObject("referer", request.getHeader("referer"));
            return modelAndView;
        }
    }
}