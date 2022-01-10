package loginVar;

public class loginVariable {
	private int LoginID;
	private String username, CCode;
	private String password, SID, Status ;
	public loginVariable() {
		super();
	}
	public loginVariable(int loginID, String username, String cCode, String password, String sID, String status) {
		super();
		LoginID = loginID;
		this.username = username;
		CCode = cCode;
		this.password = password;
		SID = sID;
		Status = status;
	}
	public int getLoginID() {
		return LoginID;
	}
	public void setLoginID(int loginID) {
		LoginID = loginID;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCCode() {
		return CCode;
	}
	public void setCCode(String cCode) {
		CCode = cCode;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSID() {
		return SID;
	}
	public void setSID(String sID) {
		SID = sID;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	
}
