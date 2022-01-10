package loginVar;

public class appointmentVariable {
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
	private String Status;
	private String Request;
	
	private int AppID;
	private String CommingDate; 	
	private String OptionalDate; 	
	private String SampType;
	public appointmentVariable() {
		super();
	}
	public appointmentVariable(String cCode, String cName, String fName, String mName, String lName, String title,
			String gender, String dob, String address, String phone, String email, String status, String request,
			int appID, String commingDate, String optionalDate, String sampType) {
		super();
		CCode = cCode;
		CName = cName;
		FName = fName;
		MName = mName;
		LName = lName;
		Title = title;
		Gender = gender;
		Dob = dob;
		Address = address;
		Phone = phone;
		Email = email;
		Status = status;
		Request = request;
		AppID = appID;
		CommingDate = commingDate;
		OptionalDate = optionalDate;
		SampType = sampType;
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
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getRequest() {
		return Request;
	}
	public void setRequest(String request) {
		Request = request;
	}
	public int getAppID() {
		return AppID;
	}
	public void setAppID(int appID) {
		AppID = appID;
	}
	public String getCommingDate() {
		return CommingDate;
	}
	public void setCommingDate(String commingDate) {
		CommingDate = commingDate;
	}
	public String getOptionalDate() {
		return OptionalDate;
	}
	public void setOptionalDate(String optionalDate) {
		OptionalDate = optionalDate;
	}
	public String getSampType() {
		return SampType;
	}
	public void setSampType(String sampType) {
		SampType = sampType;
	}
	
}
