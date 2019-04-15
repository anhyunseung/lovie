package poly.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.persistance.mapper.CommonMapper;
import poly.service.ICommonService;

@Service("CommonService")
public class CommonService implements ICommonService {
   @Resource(name="CommonMapper")
   private CommonMapper commonMapper;
}