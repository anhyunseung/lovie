package poly.dto;

import java.util.List;

public class InquiryDTO {

	private String inq_seq;
	private String title;
	private String contents;
	private String user_id;
	private String file_name;
	private String file_path;
	private String reg_user_no;
	private String reg_dt;
	private String chg_user_no;
	private String chg_dt;
	private List<Comment_inqDTO> clist;
	private String com_count;
	
	private String user_name;

	public String getinq_seq() {
		return inq_seq;
	}

	public void setinq_seq(String inq_seq) {
		this.inq_seq = inq_seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getfile_name() {
		return file_name;
	}

	public void setfile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getfile_path() {
		return file_path;
	}

	public void setfile_path(String file_path) {
		this.file_path = file_path;
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

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public List<Comment_inqDTO> getClist() {
		return clist;
	}

	public void setClist(List<Comment_inqDTO> clist) {
		this.clist = clist;
	}
	
	public String getCom_count() {
		return com_count;
	}

	public void setCom_count(String com_count) {
		this.com_count = com_count;
	}
}