package poly.service;

import java.util.List;

import poly.dto.InquiryDTO;

public interface IInquiryService {
   
   List<InquiryDTO> getinquiryList() throws Exception;
   
   void InsertinquiryInfo(InquiryDTO pDTO) throws Exception;

   InquiryDTO getinquiryInfo(InquiryDTO pDTO) throws Exception;
   
   void updateinquiryInfo(InquiryDTO pDTO) throws Exception;
   
   void deleteinquiryInfo(InquiryDTO pDTO) throws Exception;

   String getInqUserid(String seq) throws Exception;
}