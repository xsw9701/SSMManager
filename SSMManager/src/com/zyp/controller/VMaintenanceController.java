package com.zyp.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyp.pojo.User;
import com.zyp.pojo.VMaintenance;
import com.zyp.service.DriverService;
import com.zyp.service.VInfoService;
import com.zyp.service.VMaintenanceService;
import com.zyp.util.CreateNumber;
import com.zyp.util.Pagination;

/**
 * 维修记录Controller
 * 
 * @author zyp 负责转发和相应 vmaintenance 的操作
 */
@Controller
@RequestMapping("/vmaintenance")
public class VMaintenanceController {
	@Autowired
	@Qualifier("vmaintenanceService")
	private VMaintenanceService vmaintenanceService;
	
	@Autowired
	private VInfoService vinfoService;
	@Autowired
	private DriverService driverService;

	/**
	 * 返回维修记录数据
	 * 
	 * @return
	 */
	@RequestMapping("/toList")
	public String toList() {
		return "jsp/vmaintenance/list";
	}

	/**
	 * 返回维修记录数据
	 * 
	 * @param pagination
	 * @return data
	 */
	@RequestMapping("/list")
	@ResponseBody
	public String list(Pagination pagination) {
		String data = vmaintenanceService.vmaintenanceList(pagination);
		return data;
	}

	/**
	 * 注册维修记录
	 * 
	 * @param vmaintenance
	 * @return 状态
	 */
	@RequestMapping("/regist")
	@ResponseBody
	public String regist(VMaintenance vmaintenance) {
		vmaintenance.setVnumber(CreateNumber.generateRandomStr(8));
		vmaintenanceService.addVMaintenance(vmaintenance);
		return "ok";
	}

	/**
	 * 删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/detele")
	@ResponseBody
	public String delete(VMaintenance vmaintenance) {
		vmaintenanceService.deleteVMaintenance(vmaintenance);
		return "ok";
	}

	// 通过id获取用户数据
	@RequestMapping("/findUserById")
	@ResponseBody
	public String findVMaintenanceById(String id) {
		return vmaintenanceService.fingVMaintenanceById(id);
	}

	// 通过用户数据跟新数据库
	@RequestMapping("/update")
	@ResponseBody
	public String updateVMaintenance(VMaintenance vmaintenance) {
		vmaintenanceService.updateVMaintenance(vmaintenance);
		return "";
	}

	// 时间
	@org.springframework.web.bind.annotation.InitBinder
	public void InitBinder(HttpServletRequest request, ServletRequestDataBinder binder) {
		// 不要删除下行注释!!! 将来"yyyy-MM-dd"将配置到properties文件中
		// SimpleDateFormat dateFormat = new
		// SimpleDateFormat(getText("date.format", request.getLocale()));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, null, new CustomDateEditor(dateFormat, true));
	}
	
	@RequestMapping("/findIDAndNumberVinfo")
	@ResponseBody
	public String findIDAndNumberVinfo() {
		return vinfoService.findIDAndNumber();
	}
	
	@RequestMapping("/findIDAndNumberDriver")
	@ResponseBody
	public String findIDAndNumberdriver() {
		return driverService.findIDAndNumber();
	}

}
