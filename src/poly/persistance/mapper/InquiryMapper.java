package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.InquiryDTO;

@Mapper("InquiryMapper")
public interface InquiryMapper {

   List<InquiryDTO> getinquiryList() throws Exception;

   void InsertinquiryInfo(InquiryDTO pDTO) throws Exception;

   void updateinquiryInfo(InquiryDTO pDTO) throws Exception;

   InquiryDTO getinquiryInfo(InquiryDTO pDTO) throws Exception;

   void deleteinquiryInfo(InquiryDTO pDTO) throws Exception;

   String getInqUserid(String uDto) throws Exception;

}