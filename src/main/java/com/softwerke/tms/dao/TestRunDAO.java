package com.softwerke.tms.dao;

import com.softwerke.tms.repository.TestRun;

public interface TestRunDAO {

    TestRun getTestRun(int test, int run);

}
