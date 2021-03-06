package bean;

public class UserInfo {

	private Integer userId;
	private String userName;
	private String userSex;
	private Integer userAge;
	private String userAddress;

	public UserInfo() {
	}
	
	public UserInfo(String userName, Integer userAge) {
		this.userName = userName;
		this.userAge = userAge;
	}

	public UserInfo(Integer userId, String userName, String userSex, Integer userAge, String userAddress) {
		this.userId = userId;
		this.userName = userName;
		this.userSex = userSex;
		this.userAge = userAge;
		this.userAddress = userAddress;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public Integer getUserAge() {
		return userAge;
	}

	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	@Override
	public String toString() {
		return "UserInfo [userId=" + userId + ", userName=" + userName + ", userSex=" + userSex + ", userAge=" + userAge
				+ ", userAddress=" + userAddress + "]";
	}
}
