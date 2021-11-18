create database dbWebsiteRentHotel
GO
USE dbWebsiteRentHotel
GO
create table LoaiTaiKhoan
(
	MaLoaiTaiKhoan int identity(1,1) primary key ,
	TenLoai nvarchar(20)
);
GO
create table TaiKhoan
(
	MaTaiKhoan int identity(1,1) primary key,
	Email nvarchar(50),
	MatKhau varchar(100),
	MaLoaiTK int references LoaiTaiKhoan(MaLoaiTaiKhoan)
);

GO
create table KhachHang
(
	MaKhachHang int identity(1,1) primary key,
	TenKhachHang nvarchar(50),
	SoDienThoai varchar(10),
	CMND varchar(12),
	Email varchar(50),
	MaTaiKhoan int references TaiKhoan(MaTaiKhoan)
);
GO

create table DonDatPhong
(
	MaDonDat int identity(1,1) primary key,
	MaKhachHang int references KhachHang(MaKhachHang),
	SoLuongNguoiLon int,
	SoLuongTreEm int,
	NgayBatDau datetime,
	NgayKetThuc datetime,
	TrangThai bit
);
GO
create table KhachSan
(
	MaKhachSan int identity(1,1) primary key,
	TenKhachSan nvarchar(30),
	DiaChi nvarchar(50),
	Anh varchar(100)
);
GO
create table Phong 
(
	MaPhong int identity(1,1) primary key,
	TenPhong nvarchar(50),
	DonGia int,
	MaKhachSan int references KhachSan(MaKhachSan)
);

GO
create table ChiTietDonDatPhong
(
	MaDonDat int references DonDatPhong(MaDonDat),
	MaPhong int references Phong(MaPhong),
	constraint PK_CTDonDatPhong primary key(MaDonDat,MaPhong)
);
GO
alter table ChiTietDonDatPhong
add SoGiuong int
GO
create table DichVu
(
	MaDichVu int identity(1,1) primary key,
	TenDichVu nvarchar(50)
);
GO
create table DichVu_KhachSan
(
	MaDichVu int references DichVu(MaDichVu),
	MaKhachSan int references KhachSan(MaKhachSan),
	Gia int,
	constraint PK_DV_KS primary key(MaDichVu,MaKhachSan)
);
GO
create table DanhGia_Phong
(
	MaPhong int references Phong(MaPhong),
	MaTaiKhoan int references Taikhoan(MaTaiKhoan),
	Diem int check(Diem>=0 and Diem<=10),
	TextDanhGia nvarchar(200),
	SoLike int default 0,
	constraint PK_DG_P primary key(MaPhong,MaTaiKhoan)
);
GO
create table DanhGia_KhachSan 
(
	MaKhachSan int references KhachSan(MaKhachSan),
	MaTaiKhoan int references Taikhoan(MaTaiKhoan),
	Diem int check(Diem>=0 and Diem<=10),
	TextDanhGia nvarchar(200),
	SoLike int default 0,
	constraint PK_DG_KS primary key(MaKhachSan,MaTaiKhoan)
);
GO
create table Phong_Anh
(
	MaPhong int references Phong(MaPhong),
	Anh varchar(100),
	constraint PK_P_A primary key(MaPhong,Anh)
);


GO

---insert dữ liệu mặc định---
---2 loại tài khoản admin, customer---
insert into LoaiTaiKhoan(TenLoai)
values('admin'),('customer')
---proc---
go
create proc check_Login
@email nvarchar(30),@password varchar(100)
as
select * from TaiKhoan
where Email=@email and MatKhau=@password

go
create proc insert_TaiKhoan
@email varchar(50), @MatKhau varchar(100), @LoaiTaiKhoan int
as 
insert into TaiKhoan(Email,MatKhau,MaLoaiTK)
values(@email,@MatKhau,@LoaiTaiKhoan);

go
create proc show_TaiKhoan
as
select * from TaiKhoan

go
create proc update_TaiKhoan
@MaTaiKhoan int,@MatKhau_moi varchar(100)
as
update TaiKhoan
set MatKhau=@MatKhau_moi
where MaTaiKhoan=@MaTaiKhoan

go
create proc delete_TaiKhoan
@MaTaiKhoan int
as
delete TaiKhoan
where MaTaiKhoan=@MaTaiKhoan

go
create proc Sign_up
@Email varchar(50), @MatKhau varchar(100),
@HoTenKH nvarchar(50), @SDT varchar(10),
@CMND varchar(12) 
as
begin
	insert TaiKhoan(Email,MatKhau,MaLoaiTK) 
	values(@Email,@MatKhau,2);
	declare @MaTK int
	set @MaTK=(select MaTaiKhoan from TaiKhoan where MatKhau=@MatKhau and Email=@Email)
	insert into KhachHang(TenKhachHang,SoDienThoai,CMND,Email,MaTaiKhoan)
	values(@HoTenKH,@SDT,@CMND,@Email,@MaTK)
end;

go
create proc insert_KhachSan
@TenKS nvarchar(30),@Diachi nvarchar(50),@Anh varchar(100)
as
insert into KhachSan(TenKhachSan,DiaChi,Anh)
values(@TenKS,@Diachi,@Anh)

go
create proc update_KhachSan 
@MaKS int, @TenKS nvarchar(30),@Diachi nvarchar(50),@Anh varchar(100)
as
update KhachSan
set TenKhachSan=@TenKS, DiaChi=@Diachi, Anh=@Anh
where MaKhachSan=@MaKS

go
create proc delete_KhachSan 
@MaKhachSan int
as
delete KhachSan
where MaKhachSan=@MaKhachSan

go
create proc search_KhachSan_DiaDiem
@DiaDiem nvarchar(50)
as
select * from KhachSan
where DiaChi like N'%'+@DiaDiem+'%'

go
create proc show_KhachSan
as
select * from KhachSan

go
create proc insert_Phong
@TenPhong nvarchar(50),@DonGia int,@SoGiuong int,
@MaKhachSan int
as
insert into Phong(TenPhong,DonGia,SoGiuong,MaKhachSan)
values(@TenPhong,@DonGia,@SoGiuong,@MaKhachSan)


go
create proc update_Phong
@TenPhong nvarchar(50), @DonGia int, @SoGiuong int, @MaKhachSan int,@MaPhong int
as
update Phong
set TenPhong=@TenPhong,DonGia=@DonGia,SoGiuong=@SoGiuong,MaKhachSan=@MaKhachSan
where MaPhong=@MaPhong

go
create proc delete_Phong
@MaPhong int
as
delete Phong
where MaPhong=@MaPhong


----search--------
go
create proc show_Phong_MaKS
@MaKhachSan int
as
select * from Phong
where MaKhachSan=@MaKhachSan
---------------------------
go
create proc show_DonDatPhong
as
select * from DonDatPhong

go 
create proc update_DonDatPhong
@MaDonDat int,@SoLuongNguoiLon int,
@SoLuongTreEm int, @NgayBatDau datetime,
@NgayKetThuc datetime,@Trangthai bit
as
update DonDatPhong
set SoLuongNguoiLon=@SoLuongNguoiLon,SoLuongTreEm=@SoLuongTreEm,
NgayBatDau=@NgayBatDau,NgayKetThuc=@NgayKetThuc,TrangThai=@Trangthai
where MaDonDat=@MaDonDat

--go
--create proc search_DonDatPhong
--@MaDonDat int,@SoLuongNguoiLon int,
--@SoLuongTreEm int, @NgayBatDau datetime,
--@NgayKetThuc datetime,@Trangthai bit,
--@MaKhachHang int
--as
----------------------
go
create proc delete_DonDatPhong
@MaDonDatPhong int
as
delete DonDatPhong
where MaDonDat=@MaDonDatPhong

go
create proc show_DichVu
as
select * from DichVu

go
create proc insert_DichVu
@TenDichVu nvarchar(50)
as
insert into DichVu(TenDichVu)
values(@TenDichVu)

go
create proc update_DichVu
@MaDichVu int,@TenDichVu int
as
update DichVu
set TenDichVu=@TenDichVu
where MaDichVu=@MaDichVu

go
create proc update_DichVu_KhachSan
@MaDichVu int,@MaKhachSan int,@Gia int
as
update DichVu_KhachSan
set Gia=@Gia
where MaDichVu=@MaDichVu and MaKhachSan=@MaKhachSan

go
create proc insert_DanhGia_KS
@MaKhachSan int, @MaTaiKhoan int,
@Diem int, @TextDanhGia nvarchar(200),
@SoLike int
as
insert into DanhGia_KhachSan
values(@MaKhachSan, @MaTaiKhoan,@Diem, @TextDanhGia,@SoLike);

go
create proc update_Like_DanhGia_KS
@MaKhachSan int,@MaTaiKhoan int
as
update DanhGia_KhachSan
set SoLike=SoLike+1
where MaKhachSan=@MaKhachSan and MaTaiKhoan=@MaTaiKhoan

go
create proc delete_DanhGia_KS
@MaKhachSan int, @MaTaiKhoan int
as
delete DanhGia_KhachSan
where MaKhachSan=@MaKhachSan and MaTaiKhoan=@MaTaiKhoan


go
create proc insert_DanhGia_Phong
@MaPhong int, @MaTaiKhoan int,
@Diem int, @TextDanhGia nvarchar(200),
@SoLike int
as
insert into DanhGia_Phong
values(@MaPhong, @MaTaiKhoan,@Diem, @TextDanhGia,@SoLike);

go
create proc update_Like_DanhGia_Phong
@MaPhong int,@MaTaiKhoan int
as
update DanhGia_Phong
set SoLike=SoLike+1
where MaPhong=@MaPhong and MaTaiKhoan=@MaTaiKhoan

go
create proc delete_DanhGia_Phong
@MaPhong int, @MaTaiKhoan int
as
delete DanhGia_Phong
where MaPhong=@MaPhong and MaTaiKhoan=@MaTaiKhoan

go
create proc ThanhToan
@MaDonDatPhong int
as
update DonDatPhong
set TrangThai=1
where MaDonDat=@MaDonDatPhong



exec check_Login 'phongnguyendx@gmail.com','123'