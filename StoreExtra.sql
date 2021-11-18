-- CHI TIẾT KHÁCH SẠN
create proc show_detailHotel @HotelId int
as
begin
	select * from KhachSan where MaKhachSan=@HotelId
end
go
-- DANH SÁCH PHÒNG CỦA KHÁCH SẠN
create proc show_allRoom_In_Hotel @HotelId int
as  
begin
	select * from Phong where MaKhachSan=@HotelId
end
exec show_allRoom_In_Hotel 1
GO 
-- DANH SÁCH HÌNH ẢNH CỦA PHÒNG
create proc show_allImage_In_Room @RoomID int
as  
begin
	select * from Phong_Anh where MaPhong=@RoomID
end
GO 
-- THÔNG TIN KHÁCH HÀNG TỪ MÃ TÀI KHOẢN
create proc show_KhachHang_By_ID_TaiKhoan @Matk int
as
begin
	select * from KhachHang where MaTaiKhoan=@Matk
end
go
exec show_KhachHang_By_ID_TaiKhoan 1
-- THÊM ĐƠN ĐẶT
create proc insert_DonDatPhong @MaKhachHang int,@SoLuongNguoiLon int, @SoLuongTreEm int, @NgayBatDau datetime, @NgayKetThuc datetime
as
begin
	insert into  DonDatPhong output inserted.MaDonDat values(@MaKhachHang,@SoLuongNguoiLon,@SoLuongTreEm,@NgayBatDau,@NgayKetThuc,1)
end
exec insert_DonDatPhong 1,2,2,'11/18/2021','11/19/2021'
go
-- THÊM CHI TIET DON DAT HANG
create proc insert_ChiTiet_DonDatPhong @MaPhong int,@MaDon int
as
begin
	insert into ChiTietDonDatPhong values(@MaDon,@MaPhong)
end