package com.mannir.model;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@PersistenceCapable
public class PROFILES {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private int id;	
    public String age="";
    public String appearance="";
    public String bestFeature="";
    public String birthdate="";
    public String birthdate_day="";
    public String birthdate_month="";
    public String birthdate_year="";
    public String blobkey="";
    public String bodyArt="";
    public String bodyStyle="";
    public String childrenHave="";
    public String childrenNumber="";
    public String childrenOldest="";
    public String childrenWant="";
    public String childrenYoungest="";
    public String cityLive="";
    public String complexion="";
    public String countryLive="";
    public String drink="";
    public String education="";
    public String employmentStatus="";
    public String englishAbility="";
    public String ethnicity="";
    public String eyeColor="";
    public String eyeWear="";
    public String facialHair="";
    public String firstName="";
    public String firstname="";
    public String gender="";
    public String hairColor="";
    public String hairLength="";
    public String hairType="";
    public String height="";
    public String homeType="";
    public String incomeBracket="";
    public String incomeCurrency="";
    public String languageSpoken="";
    public String lastName="";
    public String lastname="";
    public String livingSituation="";
    public String maritalStatus="";
    public String mobileno="";
    public String nationality="";
    public String occupation="";
    public String p="";
    public String password="";
    public String petsHave="";
    public String polygamy="";
    public String profilebtn="";
    public String religion="";
    public String relocate="";
    public String resetCurrency="";
    public String smoke="";
    public String starSign="";
    public String stateLive="";
    public String tribe="";
    public String userid="";
    public String username="";
    public String weight="";
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAppearance() {
		return appearance;
	}
	public void setAppearance(String appearance) {
		this.appearance = appearance;
	}
	public String getBestFeature() {
		return bestFeature;
	}
	public void setBestFeature(String bestFeature) {
		this.bestFeature = bestFeature;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getBirthdate_day() {
		return birthdate_day;
	}
	public void setBirthdate_day(String birthdate_day) {
		this.birthdate_day = birthdate_day;
	}
	public String getBirthdate_month() {
		return birthdate_month;
	}
	public void setBirthdate_month(String birthdate_month) {
		this.birthdate_month = birthdate_month;
	}
	public String getBirthdate_year() {
		return birthdate_year;
	}
	public void setBirthdate_year(String birthdate_year) {
		this.birthdate_year = birthdate_year;
	}
	public String getBlobkey() {
		return blobkey;
	}
	public void setBlobkey(String blobkey) {
		this.blobkey = blobkey;
	}
	public String getBodyArt() {
		return bodyArt;
	}
	public void setBodyArt(String bodyArt) {
		this.bodyArt = bodyArt;
	}
	public String getBodyStyle() {
		return bodyStyle;
	}
	public void setBodyStyle(String bodyStyle) {
		this.bodyStyle = bodyStyle;
	}
	public String getChildrenHave() {
		return childrenHave;
	}
	public void setChildrenHave(String childrenHave) {
		this.childrenHave = childrenHave;
	}
	public String getChildrenNumber() {
		return childrenNumber;
	}
	public void setChildrenNumber(String childrenNumber) {
		this.childrenNumber = childrenNumber;
	}
	public String getChildrenOldest() {
		return childrenOldest;
	}
	public void setChildrenOldest(String childrenOldest) {
		this.childrenOldest = childrenOldest;
	}
	public String getChildrenWant() {
		return childrenWant;
	}
	public void setChildrenWant(String childrenWant) {
		this.childrenWant = childrenWant;
	}
	public String getChildrenYoungest() {
		return childrenYoungest;
	}
	public void setChildrenYoungest(String childrenYoungest) {
		this.childrenYoungest = childrenYoungest;
	}
	public String getCityLive() {
		return cityLive;
	}
	public void setCityLive(String cityLive) {
		this.cityLive = cityLive;
	}
	public String getComplexion() {
		return complexion;
	}
	public void setComplexion(String complexion) {
		this.complexion = complexion;
	}
	public String getCountryLive() {
		return countryLive;
	}
	public void setCountryLive(String countryLive) {
		this.countryLive = countryLive;
	}
	public String getDrink() {
		return drink;
	}
	public void setDrink(String drink) {
		this.drink = drink;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getEmploymentStatus() {
		return employmentStatus;
	}
	public void setEmploymentStatus(String employmentStatus) {
		this.employmentStatus = employmentStatus;
	}
	public String getEnglishAbility() {
		return englishAbility;
	}
	public void setEnglishAbility(String englishAbility) {
		this.englishAbility = englishAbility;
	}
	public String getEthnicity() {
		return ethnicity;
	}
	public void setEthnicity(String ethnicity) {
		this.ethnicity = ethnicity;
	}
	public String getEyeColor() {
		return eyeColor;
	}
	public void setEyeColor(String eyeColor) {
		this.eyeColor = eyeColor;
	}
	public String getEyeWear() {
		return eyeWear;
	}
	public void setEyeWear(String eyeWear) {
		this.eyeWear = eyeWear;
	}
	public String getFacialHair() {
		return facialHair;
	}
	public void setFacialHair(String facialHair) {
		this.facialHair = facialHair;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHairColor() {
		return hairColor;
	}
	public void setHairColor(String hairColor) {
		this.hairColor = hairColor;
	}
	public String getHairLength() {
		return hairLength;
	}
	public void setHairLength(String hairLength) {
		this.hairLength = hairLength;
	}
	public String getHairType() {
		return hairType;
	}
	public void setHairType(String hairType) {
		this.hairType = hairType;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getHomeType() {
		return homeType;
	}
	public void setHomeType(String homeType) {
		this.homeType = homeType;
	}
	public String getIncomeBracket() {
		return incomeBracket;
	}
	public void setIncomeBracket(String incomeBracket) {
		this.incomeBracket = incomeBracket;
	}
	public String getIncomeCurrency() {
		return incomeCurrency;
	}
	public void setIncomeCurrency(String incomeCurrency) {
		this.incomeCurrency = incomeCurrency;
	}
	public String getLanguageSpoken() {
		return languageSpoken;
	}
	public void setLanguageSpoken(String languageSpoken) {
		this.languageSpoken = languageSpoken;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getLivingSituation() {
		return livingSituation;
	}
	public void setLivingSituation(String livingSituation) {
		this.livingSituation = livingSituation;
	}
	public String getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	public String getMobileno() {
		return mobileno;
	}
	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getP() {
		return p;
	}
	public void setP(String p) {
		this.p = p;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPetsHave() {
		return petsHave;
	}
	public void setPetsHave(String petsHave) {
		this.petsHave = petsHave;
	}
	public String getPolygamy() {
		return polygamy;
	}
	public void setPolygamy(String polygamy) {
		this.polygamy = polygamy;
	}
	public String getProfilebtn() {
		return profilebtn;
	}
	public void setProfilebtn(String profilebtn) {
		this.profilebtn = profilebtn;
	}
	public String getReligion() {
		return religion;
	}
	public void setReligion(String religion) {
		this.religion = religion;
	}
	public String getRelocate() {
		return relocate;
	}
	public void setRelocate(String relocate) {
		this.relocate = relocate;
	}
	public String getResetCurrency() {
		return resetCurrency;
	}
	public void setResetCurrency(String resetCurrency) {
		this.resetCurrency = resetCurrency;
	}
	public String getSmoke() {
		return smoke;
	}
	public void setSmoke(String smoke) {
		this.smoke = smoke;
	}
	public String getStarSign() {
		return starSign;
	}
	public void setStarSign(String starSign) {
		this.starSign = starSign;
	}
	public String getStateLive() {
		return stateLive;
	}
	public void setStateLive(String stateLive) {
		this.stateLive = stateLive;
	}
	public String getTribe() {
		return tribe;
	}
	public void setTribe(String tribe) {
		this.tribe = tribe;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
    
    
	
}
