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
	/** @功能：分页获取所有商品 */
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
	/** @功能：获取某个商品的详细信息 */
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
			/* ①首先补齐长度 */
			int blank=perR-list.size();			//因为每页显示perR条记录，所以list的长度只能等于perR或小于perR
			if(blank>0){						//若list的长度小于perR，则向list中存放blank个null值，将list长度补齐到perR
				for(int i=0;i<blank;i++)
					list.add(null);
			}			
			/* ②然后进行划分 */
			for(int i=0;i<3;i++){				//平均分成3份
				List temp=new ArrayList();
				for(int j=0;j<4;j++){			//将每份中的元素存储到temp中
					temp.add(list.get(4*i+j));
				}
				goodslist.add(temp);			//存储temp到medialist中
			}			
		}
		return goodslist;
	}
	/** @功能：修改商品库存量 */
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
