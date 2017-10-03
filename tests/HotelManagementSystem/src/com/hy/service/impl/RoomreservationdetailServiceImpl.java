package com.hy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hy.dao.ClientinfoMapper;
import com.hy.dao.CreditcardMapper;
import com.hy.dao.MembercardMapper;
import com.hy.dao.OtherinfoMapper;
import com.hy.dao.RoomreservationMapper;
import com.hy.dao.RoomreservationdetailMapper;
import com.hy.dao.RoomsMapper;
import com.hy.page.Page;
import com.hy.po.Clientinfo;
import com.hy.po.Creditcard;
import com.hy.po.Membercard;
import com.hy.po.Roomreservation;
import com.hy.po.Roomreservationdetail;
import com.hy.po.Rooms;
import com.hy.service.RoomreservationdetailService;
import com.hy.vo.OtherInfo;
import com.hy.vo.RoomReservationDetail;
import com.hy.vo.RoomReservationDetailParam;
import com.hy.vo.SettleAccountsParam;

@Transactional
@Service("roomreservationdetailService")
public class RoomreservationdetailServiceImpl extends BaseServiceImpl<Roomreservationdetail> implements RoomreservationdetailService {

	@Autowired
	private RoomreservationdetailMapper roomreservationdetailMapper;
	//这句必须要加上。不然会报空指针异常，因为在实际掉用的时候不是BaseDao调用，
	//而是这个userDao,调用父类BaseServiceImpl里的setBaseDao方法，将userDao设置进去
	@Autowired
	public void setBaseMapper(){
		super.setBaseMapper(roomreservationdetailMapper);
	}
	
	@Autowired
	private CreditcardMapper creditcardMapper;
	@Autowired
	private MembercardMapper membercardMapper;
	@Autowired
	private OtherinfoMapper otherinfoMapper;
	@Autowired
	private ClientinfoMapper clientinfoMapper;
	@Autowired
	private RoomreservationMapper roomreservationMapper;
	@Autowired
	private RoomsMapper roomsMapper;
	
	
	@Override
	public List<Roomreservationdetail> findByForeignKey(int id) {
		return roomreservationdetailMapper.findByForeignKey(id);
	}
	@Override
	public Page<RoomReservationDetail> queryPage(RoomReservationDetailParam detailParam,
			Page<RoomReservationDetail> page) {
		List<RoomReservationDetail> detail = roomreservationdetailMapper.queryPage(detailParam);
		page.setTotal(roomreservationdetailMapper.count(detailParam));
		page.setResult(detail);
		page.visiblePages();//计算分页显示
		return page;
	}
	
	//保存客人信息
	@Override
	public int saveClientinfo(Roomreservation roomreservation,Roomreservationdetail detail, OtherInfo otherinfo,
			Clientinfo clientinfo, Creditcard creditcard, Membercard membercard) {
		
		if(otherinfo.getCreditcardid() == null && creditcard.getCreditcardnumber() != ""){
			creditcardMapper.insertSelective(creditcard);
			otherinfo.setCreditcardid(creditcard.getCreditcardid());
		}
		if(otherinfo.getMembercardid() == null && membercard.getMembercardnumber() != ""){
			membercardMapper.insertSelective(membercard);
			otherinfo.setMembercardid(membercard.getMembercardid());
		}
		if(otherinfo.getOtherinfoid() == null){
			otherinfoMapper.insertSelective(otherinfo);
		}else {
			otherinfoMapper.updateByPrimaryKeySelective(otherinfo);
		}
		roomreservationMapper.updateByPrimaryKeySelective(roomreservation);
		roomreservationdetailMapper.updateByPrimaryKeySelective(detail);
		int coutn = clientinfoMapper.updateByPrimaryKeySelective(clientinfo);
		
		return coutn;
	}
	
	@Override
	public Roomreservationdetail findByPrimaryKey(int detailid) {
		return roomreservationdetailMapper.findByPrimaryKey(detailid);
	}
	@Override
	public int alterByPrimaryKey(Roomreservationdetail record) {
		return roomreservationdetailMapper.alterByPrimaryKey(record);
	}
	@Override
	public RoomReservationDetail queryByDetailId(int detailid) {
		return roomreservationdetailMapper.queryByDetailId(detailid);
	}
	
	//换房
	@Override
	public int changeRoom(Roomreservationdetail detail, Rooms oldroom,
			Rooms newroom) {
		roomsMapper.updateByPrimaryKeySelective(oldroom);
		roomsMapper.updateByPrimaryKeySelective(newroom);
		return roomreservationdetailMapper.updateByPrimaryKeySelective(detail);
	}
	
	@Override
	public RoomReservationDetail queryByRoomsId(int roomsid, int roomstatus) {
		return roomreservationdetailMapper.queryByRoomsId(roomsid, roomstatus);
	}
	@Override
	public List<RoomReservationDetail> querySettleAccountsList(
			SettleAccountsParam params) {
		return roomreservationdetailMapper.querySettleAccountsList(params);
	}
	
}