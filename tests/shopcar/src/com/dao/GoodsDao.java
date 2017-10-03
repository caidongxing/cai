package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.toolsbean.DB;
import com.toolsbean.StringHandler;
import com.valuebean.GoodsBean;

public class GoodsDao extends SuperDao{
	private DB mydb=null;
	public GoodsDao(){
		mydb=new DB();
	}
	/** @���ܣ���ҳ��ȡ������Ʒ */
	public List getAllGoods(String strcurrentP,String strcurrentG,String goWhich) throws SQLException{
		String sqlall="select * from tb_goods order by goods_stocktime desc";
		setDaoPage(sqlall,null,strcurrentP, strcurrentG, goWhich);
		int currentP=getDaoPage().getCurrentP();
		int top1=getDaoPage().getPerR();
		int top2=(currentP-1)*top1;
		
		String sqlsub="";
		if(currentP==1)
			sqlsub="select top "+top1+" * from tb_goods order by goods_stocktime desc";
		else
			sqlsub="select top "+top1+" * from tb_goods where (goods_stocktime < (select min(goods_stocktime) from (select top "+top2+" * from tb_goods order by goods_stocktime desc) as minv)) order by goods_stocktime desc";
		
		List alllist=getList(sqlsub,null);
		List goodslist=divide(alllist,top1);
		return goodslist;		
	}
	/** @���ܣ���ȡĳ����Ʒ����ϸ��Ϣ */
	public GoodsBean getSingleGoods(int id) throws SQLException{
		GoodsBean single=null;
		String sql="select * from tb_goods where id=?";
		Object[] params={id};
		List list=getList(sql,params);
		if(list!=null&&list.size()!=0)
			single=(GoodsBean)list.get(0);
		return single;
	}

	private List getList(String sql,Object[] params) throws SQLException{
		List list=null;
		mydb.doPstm(sql,params);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			list=new ArrayList();
			while(rs.next()){
				GoodsBean single=new GoodsBean();
				single.setId(rs.getInt(1));
				single.setGoodsViewpic(rs.getString(2));
				single.setGoodsName(rs.getString(3));
				single.setGoodsPrice(rs.getFloat(4));
				single.setGoodsStoreNum(rs.getInt(5));
				single.setGoodsStocktime(StringHandler.timeTostr(rs.getTimestamp(6)));
				single.setGoodsInfo(rs.getString(7));
				single.setGoodsMaker(rs.getString(8));
				list.add(single);
			}
			rs.close();
		}
		return list;
	}
	private List divide(List list,int perR){
		List goodslist=null;
		if(list!=null){
			goodslist=new ArrayList();
			/* �����Ȳ��볤�� */
			int blank=perR-list.size();			//��Ϊÿҳ��ʾperR����¼������list�ĳ���ֻ�ܵ���perR��С��perR
			if(blank>0){						//��list�ĳ���С��perR������list�д��blank��nullֵ����list���Ȳ��뵽perR
				for(int i=0;i<blank;i++)
					list.add(null);
			}			
			/* ��Ȼ����л��� */
			for(int i=0;i<3;i++){				//ƽ���ֳ�3��
				List temp=new ArrayList();
				for(int j=0;j<4;j++){			//��ÿ���е�Ԫ�ش洢��temp��
					temp.add(list.get(4*i+j));
				}
				goodslist.add(temp);			//�洢temp��medialist��
			}			
		}
		return goodslist;
	}
	/** @���ܣ��޸���Ʒ����� */
	public void updateStoreNum(int buynum,int id){
		String sql="update tb_goods set goods_storenum=goods_storenum-? where id=?";
		Object[] params={buynum,id};
		mydb.doPstm(sql, params);
	}
	public int getGoodsStoreNum(int id){
		int num=0;
		String sql="select goods_storenum from tb_goods where id=?";
		Object[] params={id};
		mydb.doPstm(sql, params);
		try {
			ResultSet rs = mydb.getRs();
			if(rs!=null&&rs.next())
				num=rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
	public void closed(){
		mydb.closed();
	}
}