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
				member.setEmail(loadMemberInfo.Email);
				member.setMemberid(String.valueOf(loadMemberInfo.Member_id));
			} 
		
			}catch(Exception e)
			{
			ExceptionHandler.loginException(e);
			}
		return member;
	
	}






}