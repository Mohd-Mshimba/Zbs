package loginVar;

public class sampleLabStaff {
	private String LabID, Sup_ID;
	private String LabName, Location;
	private String SID,FName, MName, LName, Title,	Gender,	Address, Phone,	Email, Status, Signature, Photo, DOB;
	private String SCode;
	private String SName;
	private String Brand;
	private String Batch;
	private String ProdDate; 
	private String ExpDate; 
	private String SType;
	private String Manufacture;
	private String RecStaffID;
	private String CCode;
	private String RecDate; 
	private String CustType;
	private String SampStaffID;
	private String SampDate; 
	private String SubmTo;
	private String SubmDate;
	private String AnalyzerID;
	private String ResultDate; 
	private String Remark;
	private String Approval;	
	private int SampQuantity;	
	private int RQuantity;
	private int SubmQuantity;
	
	private String CName;
	private String Dob;
	private String Request;
	
	private int Analyzer;
	private String Finding;
	private String DateReported;
	public sampleLabStaff() {
		super();
	}
	public sampleLabStaff(String labID, String sup_ID, String labName, String location, String sID, String fName,
			String mName, String lName, String title, String gender, String address, String phone, String email,
			String status, String signature, String photo, String dOB, String sCode, String sName, String brand,
			String batch, String prodDate, String expDate, String sType, String manufacture, String recStaffID,
			String cCode, String recDate, String custType, String sampStaffID, String sampDate, String submTo,
			String submDate, String analyzerID, String resultDate, String remark, String approval, int sampQuantity,
			int rQuantity, int submQuantity, String cName, String dob2, String request, int analyzer, String finding,
			String dateReported) {
		super();
		LabID = labID;
		Sup_ID = sup_ID;
		LabName = labName;
		Location = location;
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
		SCode = sCode;
		SName = sName;
		Brand = brand;
		Batch = batch;
		ProdDate = prodDate;
		ExpDate = expDate;
		SType = sType;
		Manufacture = manufacture;
		RecStaffID = recStaffID;
		CCode = cCode;
		RecDate = recDate;
		CustType = custType;
		SampStaffID = sampStaffID;
		SampDate = sampDate;
		SubmTo = submTo;
		SubmDate = submDate;
		AnalyzerID = analyzerID;
		ResultDate = resultDate;
		Remark = remark;
		Approval = approval;
		SampQuantity = sampQuantity;
		RQuantity = rQuantity;
		SubmQuantity = submQuantity;
		CName = cName;
		Dob = dob2;
		Request = request;
		Analyzer = analyzer;
		Finding = finding;
		DateReported = dateReported;
	}
	public String getLabID() {
		return LabID;
	}
	public void setLabID(String labID) {
		LabID = labID;
	}
	public String getSup_ID() {
		return Sup_ID;
	}
	public void setSup_ID(String sup_ID) {
		Sup_ID = sup_ID;
	}
	public String getLabName() {
		return LabName;
	}
	public void setLabName(String labName) {
		LabName = labName;
	}
	public String getLocation() {
		return Location;
	}
	public void setLocation(String location) {
		Location = location;
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
	public String getSCode() {
		return SCode;
	}
	public void setSCode(String sCode) {
		SCode = sCode;
	}
	public String getSName() {
		return SName;
	}
	public void setSName(String sName) {
		SName = sName;
	}
	public String getBrand() {
		return Brand;
	}
	public void setBrand(String brand) {
		Brand = brand;
	}
	public String getBatch() {
		return Batch;
	}
	public void setBatch(String batch) {
		Batch = batch;
	}
	public String getProdDate() {
		return ProdDate;
	}
	public void setProdDate(String prodDate) {
		ProdDate = prodDate;
	}
	public String getExpDate() {
		return ExpDate;
	}
	public void setExpDate(String expDate) {
		ExpDate = expDate;
	}
	public String getSType() {
		return SType;
	}
	public void setSType(String sType) {
		SType = sType;
	}
	public String getManufacture() {
		return Manufacture;
	}
	public void setManufacture(String manufacture) {
		Manufacture = manufacture;
	}
	public String getRecStaffID() {
		return RecStaffID;
	}
	public void setRecStaffID(String recStaffID) {
		RecStaffID = recStaffID;
	}
	public String getCCode() {
		return CCode;
	}
	public void setCCode(String cCode) {
		CCode = cCode;
	}
	public String getRecDate() {
		return RecDate;
	}
	public void setRecDate(String recDate) {
		RecDate = recDate;
	}
	public String getCustType() {
		return CustType;
	}
	public void setCustType(String custType) {
		CustType = custType;
	}
	public String getSampStaffID() {
		return SampStaffID;
	}
	public void setSampStaffID(String sampStaffID) {
		SampStaffID = sampStaffID;
	}
	public String getSampDate() {
		return SampDate;
	}
	public void setSampDate(String sampDate) {
		SampDate = sampDate;
	}
	public String getSubmTo() {
		return SubmTo;
	}
	public void setSubmTo(String submTo) {
		SubmTo = submTo;
	}
	public String getSubmDate() {
		return SubmDate;
	}
	public void setSubmDate(String submDate) {
		SubmDate = submDate;
	}
	public String getAnalyzerID() {
		return AnalyzerID;
	}
	public void setAnalyzerID(String analyzerID) {
		AnalyzerID = analyzerID;
	}
	public String getResultDate() {
		return ResultDate;
	}
	public void setResultDate(String resultDate) {
		ResultDate = resultDate;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public String getApproval() {
		return Approval;
	}
	public void setApproval(String approval) {
		Approval = approval;
	}
	public int getSampQuantity() {
		return SampQuantity;
	}
	public void setSampQuantity(int sampQuantity) {
		SampQuantity = sampQuantity;
	}
	public int getRQuantity() {
		return RQuantity;
	}
	public void setRQuantity(int rQuantity) {
		RQuantity = rQuantity;
	}
	public int getSubmQuantity() {
		return SubmQuantity;
	}
	public void setSubmQuantity(int submQuantity) {
		SubmQuantity = submQuantity;
	}
	public String getCName() {
		return CName;
	}
	public void setCName(String cName) {
		CName = cName;
	}
	public String getDob() {
		return Dob;
	}
	public void setDob(String dob) {
		Dob = dob;
	}
	public String getRequest() {
		return Request;
	}
	public void setRequest(String request) {
		Request = request;
	}
	public int getAnalyzer() {
		return Analyzer;
	}
	public void setAnalyzer(int analyzer) {
		Analyzer = analyzer;
	}
	public String getFinding() {
		return Finding;
	}
	public void setFinding(String finding) {
		Finding = finding;
	}
	public String getDateReported() {
		return DateReported;
	}
	public void setDateReported(String dateReported) {
		DateReported = dateReported;
	}
	
	
}
