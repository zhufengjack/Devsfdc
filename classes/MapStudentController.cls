/**
*@Date/Time: 11:41 PM 19 Dec 2013
*@Author: Jack Zhu
*@Function: we will use this controller to show data from englishtown and map them with salesforce.
*/
public class MapStudentController {
	
	public Account account;
	public Member member;
	public boolean isExistedMember;
	
	public MapStudentController()
	{
		account=[Select Id,Name,PersonEmail,Username__pc from Account
						 Where id=:ApexPages.currentPage().getParameters().get('id') ];
	}
	
	public Account getAccount()
	{
		return account;
	}
	
	public Member getMember()
	{
		
			member=EtownServiceHelper.LoadStudentInfor(account.username__pc);
		
		
		return member;
	}
	
	public boolean getIsExistedMember()
	{
		if(member==null){
			member=getMember();
			if(member!=null){
				return true;
			}else{
				return false;
			}
		
		}else{
			
		return true;
		
		}
	}
	
	
	
	
	

}