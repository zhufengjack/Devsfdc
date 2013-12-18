public class EtownServiceHelper {
	public static Member LoadStudentInfor(String username)
	{
		Member member=null;
		try{
			
			EtownService.BasicHttpBinding_ISalesForceService stub=ConnectionUtil.loginOboe();
			EtownServiceDataContract.LoadStudentParamsV3 param=new EtownServiceDataContract.LoadStudentParamsV3();
			param.Username=username;
			param.RequireSyncReschedule=false;
			EtownServiceDataContract.LoadStudentResultV3 loadStudentResult = stub.LoadStudentV3(param);
			Boolean loadResult=loadStudentResult.IsSuccess;
			if(loadResult==true)
			{
				System.debug('LoadResult is true');
				member=new Member();
				EtownServiceDataContract.LoadStudent_MemberInfo loadMemberInfo=loadStudentResult.MemberInfo;
				member.email=loadMemberInfo.email;
				member.memberid=String.valueOf(loadMemberInfo.Member_id);
				member.mobilephone=loadMemberInfo.MobilePhone;
				member.status=loadMemberInfo.Status;
			} 
		
			}catch(Exception e)
			{
				ExceptionHandler.loginException(e);
			}
		return member;
	
	}






}