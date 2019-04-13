package poly.service;

import java.util.List;

import poly.dto.UserDTO;

public interface IUserService {
   public void userJoin(UserDTO uDto) throws Exception;

   String userLogin(UserDTO uDto) throws Exception;
   
   String userIdsearch(UserDTO uDto) throws Exception;

   String userPwsearch(UserDTO uDto) throws Exception;
   
   void updatePw(UserDTO uDto) throws Exception;

   List<UserDTO> getUserList() throws Exception;
   
   UserDTO getUserInfo(UserDTO pDTO) throws Exception;

   void updateUserInfo(UserDTO pDTO) throws Exception;

   void deleteUserInfo(UserDTO pDTO) throws Exception;
   
   String getidover(UserDTO uDto) throws Exception;

}