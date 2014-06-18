package com.project.service;

public interface RestntService {
	//공통, 회원, 관리자 : 식당 전체 리스트
	RestntDTO getRestntList();
	
	//공통, 회원, 관리자 : 식당 시/도 필터 적용 후 리스트
	RestntDTO getRestntListByAddess1(String address1);
	
	<!-- 공통, 회원, 관리자 : 식당 시/군/구 필터 적용 후 리스트 -->
	<select id="getRestntListByAddess2" resultType="RestntDTO" parameterType="string">
		select * from restnt where address1 = #{address1} and address2 = #{address2}
	</select>
	
	<!-- 공통, 회원, 관리자 : 식당 읍/면/동 필터 적용 후 리스트 -->
	<select id="getRestntListByAddess3" resultType="RestntDTO" parameterType="string">
		select * from restnt where address1 = #{address1} and address2 = #{address2} and address3 = #{address3}
	</select>
	
	<!-- 관리자 : 식당 삭제 -->
	<delete id="dropRestntByRestntId" parameterType="string">
		delete from restnt where id = #{restntid}
	</delete>
	
	<!-- 관리자 : 식당 수정 -->
	<update id="setRestntByRestntId"  parameterType="RestntDTO">
		update restnt set restntname = #{restntname}, restntlatitude = #{restntlatitude}, restntlongitude=#{restntlongitude}, restntphone=#{restntphone}, restnttype=#{restnttype}, restntaddress1=#{restntaddress1}, restntaddress2=#{restntaddress2}, restntaddress3=#{restntaddress3}, restntaddress4=#{restntaddress4} where restntid = #{restntid}
	</update>
	
	<!-- 관리자 : 식당 추가 -->
	<insert id="putRestnt" parameterType="RestntDTO">
		insert into restnt (restntId, restntName, restntLatitude, res tntLonogitude, restntAddress1, restntAddress2, restntAddress3, restntAddress4, restntPhone, restntType), values (#{restntId}, #{restntname}, #{restntlatitude}, #{restntlongitude}, #{restntaddress1}, #{restntaddress2}, #{restntaddress3}, #{restntaddress4}, #{restntPhone}, #{restntType})
	</insert>
}
