public class Member {
	
	public string email;
	public string firstname;
	public string lastname;
	public string memberid;
	public string username;
	public string mobilephone;
	public string status;
	
	public Member()
	{
		
	}
	public Member(String email,String firstname,String lastname,String memberid,String username,String mobilephone,String status)
	{
		this.email=email;
		this.firstname=firstname;
		this.memberid=memberid;
		this.username=username;
		this.mobilephone=mobilephone;
		this.status=status;
		
	}
	
	public string getEmail()
	{
		return this.email;
	}
	public string getMemberid()
	{
		return this.memberid;
	}
	
	
}