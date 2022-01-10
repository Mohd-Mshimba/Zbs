package loginVar;

public class userLoginVariable {
	private String  Signature;
	private String Photo;
	private String DOB;
	private String LabID;	
	private String CCode;
	private String CName;
	private String FName;
	private String MName;
	private String LName;
	private String Title;
	private String Gender;
	private String Dob;
	private String Address;
	private String Phone;
	private String Email;
	private String Request;
	
	private int LoginID;
	private String username;
	private String password, SID, Status ;
	public userLoginVariable() {
		super();
	}
	public userLoginVariable(String signature, String photo, String dOB, String labID, String cCode, String cName,
			String fName, String mName, String lName, String title, String gender, String dob2, String address,
			String phone, String email, String request, int loginID, String username, String password, String sID,
			String status) {
		super();
		Signature = signature;
		Photo = photo;
		DOB = dOB;
		LabID = labID;
		CCode = cCode;
		CName = cName;
		FName = fName;
		MName = mName;
		LName = lName;
		Title = title;
		Gender = gender;
		Dob = dob2;
		Address = address;
		Phone = phone;
		Email = email;
		Request = request;
		LoginID = loginID;
		this.username = username;
		this.password = password;
		SID = sID;
		Status = status;
	}
	public String getSignature() {
		return Signature;
	}
	public void setSignature(String signature) {
		Signature = signature;
	}
	public String getPhoto() {
		return Photo;
	}
	public void setPhoto(String photo) {
		Photo = photo;
	}
	public String getDOB() {
		return DOB;
	}
	public void setDOB(String dOB) {
		DOB = dOB;
	}
	public String getLabID() {
		return LabID;
	}
	public void setLabID(String labID) {
		LabID = labID;
	}
	public String getCCode() {
		return CCode;
	}
	public void setCCode(String cCode) {
		CCode = cCode;
	}
	public String getCName() {
		return CName;
	}
	public void setCName(String cName) {
		CName = cName;
	}
	public String getFName() {
		return FName;
	}
	public void setFName(String fName) {
		FName = fName;
	}
	public String getMName() {
		return MName;
	}
	public void setMName(String mName) {
		MName = mName;
	}
	public String getLName() {
		return LName;
	}
	public void setLName(String lName) {
		LName = lName;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public String getDob() {
		return Dob;
	}
	public void setDob(String dob) {
		Dob = dob;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getRequest() {
		return Request;
	}
	public void setRequest(String request) {
		Request = request;
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
