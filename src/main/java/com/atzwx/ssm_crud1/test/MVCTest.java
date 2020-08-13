package com.atzwx.ssm_crud1.test;

import com.atzwx.ssm_crud1.bean.Employee;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * 使用 Spring 测试模块提供的测试请求功能， 测试 CRUD 请求的正确性
 */
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml",
        "file:src/main/webapp/WEB"+"-INF/dispatcherServlet-servlet.xml"})
public class MVCTest {

    // 传入 SpringMVC 的 IOC
    @Autowired
    WebApplicationContext webApplicationContext;

    // 虚拟 MVC 请求， 获取到处理结果
    MockMvc mockMvc;

    @Before
    public void initMokcMvc(){

        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }

    @Test
    public void testPage() throws Exception {

        // 模拟请求拿到返回值
        MvcResult mvcResult = mockMvc.perform(
                MockMvcRequestBuilders.get("/emps").param("pn", "10")
        ).andReturn();

        // 请求成功以后， 请求域中会有 pageInfo， 我们可以取出 pageInfo 进行验证
        MockHttpServletRequest mockHttpServletRequest = mvcResult.getRequest();
        PageInfo pageInfo = (PageInfo) mockHttpServletRequest.getAttribute("pageInfo");

        System.out.println("当前页码：" + pageInfo.getPageNum());
        System.out.println("总页码：" + pageInfo.getPages());
        System.out.println("总记录数：" + pageInfo.getTotal());
        System.out.println("在页面需要 连续显示的页码");
        int[] nums = pageInfo.getNavigatepageNums();
        for (int i: nums){
            System.out.println(" " + i);
        }

        // 获取员工数据
        List<Employee> list =  pageInfo.getList();
        for (Employee employee:list){
            System.out.println("ID: " + employee.getEmpId()+ "==>Name: " + employee.getEmpName());
        }

    }
}
