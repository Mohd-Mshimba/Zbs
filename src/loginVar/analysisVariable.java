package loginVar;

public class analysisVariable {
	private int Analyzer;
	private String SCode;
	private String Water; 	
	private String Protein; 	
	private String Sugar; 	
	private String Calcium; 	
	private String Sodium; 	
	private String Zink; 	
	private String Energy; 	
	private String Caffein; 	
	private String Starch;
	private String Alkohol;
	private String FatyAcid;
	private String DateReported;
	private String Remark;
	private String ResultDate;
	public analysisVariable() {
		super();
	}
	public analysisVariable(int analyzer, String sCode, String water, String protein, String sugar, String calcium,
			String sodium, String zink, String energy, String caffein, String starch, String alkohol, String fatyAcid,
			String dateReported, String remark, String resultDate) {
		super();
		Analyzer = analyzer;
		SCode = sCode;
		Water = water;
		Protein = protein;
		Sugar = sugar;
		Calcium = calcium;
		Sodium = sodium;
		Zink = zink;
		Energy = energy;
		Caffein = caffein;
		Starch = starch;
		Alkohol = alkohol;
		FatyAcid = fatyAcid;
		DateReported = dateReported;
		Remark = remark;
		ResultDate = resultDate;
	}
	public int getAnalyzer() {
		return Analyzer;
	}
	public void setAnalyzer(int analyzer) {
		Analyzer = analyzer;
	}
	public String getSCode() {
		return SCode;
	}
	public void setSCode(String sCode) {
		SCode = sCode;
	}
	public String getWater() {
		return Water;
	}
	public void setWater(String water) {
		Water = water;
	}
	public String getProtein() {
		return Protein;
	}
	public void setProtein(String protein) {
		Protein = protein;
	}
	public String getSugar() {
		return Sugar;
	}
	public void setSugar(String sugar) {
		Sugar = sugar;
	}
	public String getCalcium() {
		return Calcium;
	}
	public void setCalcium(String calcium) {
		Calcium = calcium;
	}
	public String getSodium() {
		return Sodium;
	}
	public void setSodium(String sodium) {
		Sodium = sodium;
	}
	public String getZink() {
		return Zink;
	}
	public void setZink(String zink) {
		Zink = zink;
	}
	public String getEnergy() {
		return Energy;
	}
	public void setEnergy(String energy) {
		Energy = energy;
	}
	public String getCaffein() {
		return Caffein;
	}
	public void setCaffein(String caffein) {
		Caffein = caffein;
	}
	public String getStarch() {
		return Starch;
	}
	public void setStarch(String starch) {
		Starch = starch;
	}
	public String getAlkohol() {
		return Alkohol;
	}
	public void setAlkohol(String alkohol) {
		Alkohol = alkohol;
	}
	public String getFatyAcid() {
		return FatyAcid;
	}
	public void setFatyAcid(String fatyAcid) {
		FatyAcid = fatyAcid;
	}
	public String getDateReported() {
		return DateReported;
	}
	public void setDateReported(String dateReported) {
		DateReported = dateReported;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public String getResultDate() {
		return ResultDate;
	}
	public void setResultDate(String resultDate) {
		ResultDate = resultDate;
	}
	
}
