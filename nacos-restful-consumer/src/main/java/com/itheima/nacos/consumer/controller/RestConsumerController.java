package com.itheima.nacos.consumer.controller;

import com.itheima.microservice.service1.api.Service1Api;
import com.itheima.microservice.service2.api.Service2Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.net.URI;


@RestController
public class RestConsumerController {
    @Value("${provider.address}")
    private String providerAddress;


    @GetMapping(value = "/service")
    public String service(){
        RestTemplate restTemplate = new RestTemplate();
        //调用服务
        String providerResult = restTemplate.getForObject("http://" + providerAddress + "/service",String.class);

        return "consumer invoke | " + providerResult;
    }


    //通过负载均衡发现地址，流程是从服务发现中心拿nacos-restful-provider服务的列表，通过负载均衡算法获取一个地址
    @Autowired
    LoadBalancerClient loadBalancerClient;
    //指定服务名
    String serviceId = "nacos-restful-provider";

    @GetMapping(value = "/service1")
    public String service1(){
        //远程调用
        RestTemplate restTemplate = new RestTemplate();
        //发现一个地址
        ServiceInstance serviceInstance = loadBalancerClient.choose(serviceId);
        //获取一个http://开头的地址，包括ip和端口
        URI uri = serviceInstance.getUri();
        String result = restTemplate.getForObject(uri + "/service", String.class);
        return "consumer invode|"+result;
    }

    @org.apache.dubbo.config.annotation.Reference
    Service2Api service2Api;

    @org.apache.dubbo.config.annotation.Reference
    Service1Api service1Api;

    @GetMapping(value = "/service2")
    public String service2(){
        //远程调用service2
        String providerResult = service2Api.dubboService2();
        return "consumer dubbo invoke |"+providerResult;
    }
    @GetMapping(value = "/service3")
    public String service3(){
        //远程调用service1
        String providerResult = service1Api.dubboService1();
        return "consumer dubbo invoke |"+providerResult;
    }


    @Value("${common.name}")
    private String common_name;

    @Autowired
    ConfigurableApplicationContext applicationContext;

    @GetMapping(value = "/configs")
    public String getvalue(){
//        return common_name;
        String name =  applicationContext.getEnvironment().getProperty("common.name");
        String addr = applicationContext.getEnvironment().getProperty("common.addr");
        return name+"|"+addr;
    }
}