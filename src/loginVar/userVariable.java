package loginVar;

public class userVariable {
	String SID,FName, MName, LName, Title,	Gender,	Address, Phone,	Email, Status, Signature, Photo, DOB,LabID;		
		
	public userVariable() {
		super();
	}

	public userVariable(String sID, String fName, String mName, String lName, String title, String gender,
			String address, String phone, String email, String status, String signature, String photo,
			String dOB, String labID) {
		super();
		SID = sID;
		FName = fName;
		MName = mName;
		LName = lName;
		Title = title;
		Gender = gender;
		Address = address;
		Phone = phone;
		Email = email;
		Status = status;
		Signature = signature;
		Photo = photo;
		DOB = dOB;
		LabID = labID;
	}

	public String getSID() {
		return SID;
	}

	public void setSID(String sID) {
		SID = sID;
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
	
	  
}
