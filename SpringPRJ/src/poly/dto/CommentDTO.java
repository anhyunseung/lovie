package poly.dto;

public class CommentDTO {

   private String notice_seq;
   private String com_seq;
   private String contents; 
   private String reg_user_no; 
   private String reg_dt; 
   private String chg_user_no;
   private String chg_dt;

   public String getNotice_seq() {
      return notice_seq;
   }

   public void setnotice_seq(String notice_seq) {
      this.notice_seq = notice_seq;
   }

   public String getcom_seq() {
      return com_seq;
   }

   public void setcom_seq(String com_seq) {
      this.com_seq = com_seq;
   }

   public String getContents() {
      return contents;
   }

   public void setContents(String contents) {
      this.contents = contents;
   }

   public String getReg_user_no() {
      return reg_user_no;
   }

   public void setReg_user_no(String reg_user_no) {
      this.reg_user_no = reg_user_no;
   }

   public String getReg_dt() {
      return reg_dt;
   }

   public void setReg_dt(String reg_dt) {
      this.reg_dt = reg_dt;
   }

   public String getChg_user_np() {
      return chg_user_no;
   }

   public void setChg_user_no(String chg_user_no) {
      this.chg_user_no = chg_user_no;
   }

   public String getChg_dt() {
      return chg_dt;
   }

   public void setChg_dt(String chg_dt) {
      this.chg_dt = chg_dt;
   }
   
}