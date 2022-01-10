package loginVar;

public class labVariable {
	private String LabID, Sup_ID;
	private String LabName, Location;

	public labVariable() {
		super();
	}

	public labVariable(String labID, String sup_ID, String labName, String location) {
		super();
		LabID = labID;
		Sup_ID = sup_ID;
		LabName = labName;
		Location = location;
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
	
}
