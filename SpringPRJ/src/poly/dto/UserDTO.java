package poly.dto;

import com.sun.istack.internal.NotNull;

public class UserDTO {

   private String user_no; // 
   private String user_id; // 
   private String user_name; // 
   private String pwd2;
   private String email1; // 
   private String email2; // 
   private String tel_1; // 
   private String tel_2; // 
   private String tel_3; // 
   private String birthday;
   private String reg_user_no;
   private String reg_dt;
   private String chg_user_no;
   private String chg_dt;
   private String password;
   

   public String getUser_no() {
      return user_no;
   }

   public void setUser_no(@NotNull String user_no) {
      this.user_no = user_no;
   }

   public String getUser_id() {
      return user_id;
   }

   public void setUser_id(@NotNull String user_id) {
      this.user_id = user_id;
   }

   public String getUser_name() {
      return user_name;
   }

   public void setUser_name(@NotNull String user_name) {
      this.user_name = user_name;
   }
   
   public String getPassword() {
	   return password;
   }
   public void setPassword(@NotNull String password) {
	   this.password = password;
   }
   public String getPassword2() {
	   return pwd2;
   }
   public void setPassword2(String pwd2) {
	   this.pwd2 = pwd2;
   }
   public String getEmail1() {
	   return email1;
   }
   public void setEmail1(@NotNull String email1) {
	   this.email1 = email1;
   }
   public String getEmail2() {
	   return email2;
   }
   public void setEmail2(@NotNull String email2) {
	   this.email2 = email2;
   }
   public String getTel_1() {
	   return tel_1;
   }
   public void setTel_1(@NotNull String tel_1) {
	   this.tel_1 = tel_1;
   }
   public String getTel_2() {
	   return tel_2;
   }
   public void setTel_2(@NotNull String tel_2) {
	   this.tel_2 = tel_2;
   }
   public String getTel_3() {
	   return tel_3;
   }
   public void setTel_3(@NotNull String tel_3) {
	   this.tel_3 = tel_3;
   }
   public String getBirthday() {
	   return birthday;
   }
   public void setBirthday(@NotNull String birthday) {
	   this.birthday = birthday;
   }
}