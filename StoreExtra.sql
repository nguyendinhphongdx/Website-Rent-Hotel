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

-- DANH SÁCH ĐƠN HÀNG ĐÃ ĐẶT 
go
create proc show_DonDaDat @MaKh int
as 
begin
	select a.MaDonDat,a.NgayBatDau,a.NgayKetThuc,a.SoLuongNguoiLon,a.SoLuongTreEm, COUNT(a.MaDonDat) as N'SoLuongPhong',a.TrangThai,c.TenKhachSan,c.Anh
	from DonDatPhong a, ChiTietDonDatPhong b, KhachSan c, Phong d
	where a.MaDonDat = b.MaDonDat and b.MaPhong = d.MaPhong and d.MaKhachSan = c.MaKhachSan and a.MaKhachHang = @MaKh
	group by a.MaDonDat,a.NgayBatDau,a.NgayKetThuc,a.SoLuongNguoiLon,a.SoLuongTreEm,c.TenKhachSan,c.Anh,a.TrangThai
end
exec show_DonDaDat 1
-- XÓA ĐƠN HÀNG ĐÃ ĐẶT 
go
create proc delete_DonDaDat @MaDon int
as 
begin
	begin
		delete 
		from ChiTietDonDatPhong
		where MaDonDat = @MaDon
	end
	begin
		delete 
		from DonDatPhong
		where MaDonDat = @MaDon
	end
end
