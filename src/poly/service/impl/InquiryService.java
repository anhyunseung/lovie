package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.InquiryDTO;
import poly.persistance.mapper.InquiryMapper;
import poly.service.IInquiryService;

@Service("InquiryService")
public class InquiryService implements IInquiryService{
   
   @Resource(name="InquiryMapper")
   private InquiryMapper inquiryMapper;

   @Override
   public List<InquiryDTO> getinquiryList() throws Exception {
      // TODO Auto-generated method stub
      return inquiryMapper.getinquiryList();
   }

   @Override
   public void InsertinquiryInfo(InquiryDTO pDTO) throws Exception {
      // TODO Auto-generated method stub
      inquiryMapper.InsertinquiryInfo(pDTO);;
   }

   @Override
   public InquiryDTO getinquiryInfo(InquiryDTO pDTO) throws Exception {
      // TODO Auto-generated method stub
      return inquiryMapper.getinquiryInfo(pDTO);
   }

   @Override
   public void updateinquiryInfo(InquiryDTO pDTO) throws Exception {
      // TODO Auto-generated method stub
      inquiryMapper.updateinquiryInfo(pDTO);
   }

   @Override
   public void deleteinquiryInfo(InquiryDTO pDTO) throws Exception {
      // TODO Auto-generated method stub
      inquiryMapper.deleteinquiryInfo(pDTO);
   }
   
   @Override
	public String getInqUserid(String uDto) throws Exception {
		// TODO Auto-generated method stub
		return inquiryMapper.getInqUserid(uDto);
	}
}