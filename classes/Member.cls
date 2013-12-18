public class Member {
	
	private string email;
	private string firstname;
	private string lastname;
	private string memberid;
	private string username;
	
	public Member()
	{
		
	}
	public Member(String email,String firstname,String lastname,String memberid,String username)
	{
		this.email=email;
		this.firstname=firstname;
		this.memberid=memberid;
		this.username=username;
		
	}
	
	public void setEmail(String email)
	{
		this.email=email;
	}
	
	public void setName(String firstname,String lastname)
	{
		this.firstname=firstname;
		this.lastname=lastname;
	}
	
	public void setMemberid(String memberid)
	{
		this.memberid=memberid;
	}
	
	public void setUsername(String username)
	{
		this.username=username;
	}
	
	public String getMemberid()
	{
		return this.memberid;
	}

}