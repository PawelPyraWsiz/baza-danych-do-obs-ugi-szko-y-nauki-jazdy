USE [master]
GO
/****** Object:  Database [Projekt_w66952]    Script Date: 10.01.2023 18:26:33 ******/
CREATE DATABASE [Projekt_w66952]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Projekt_w66952', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\Projekt_w66952.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Projekt_w66952_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\Projekt_w66952_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Projekt_w66952] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Projekt_w66952].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Projekt_w66952] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Projekt_w66952] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Projekt_w66952] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Projekt_w66952] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Projekt_w66952] SET ARITHABORT OFF 
GO
ALTER DATABASE [Projekt_w66952] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Projekt_w66952] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Projekt_w66952] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Projekt_w66952] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Projekt_w66952] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Projekt_w66952] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Projekt_w66952] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Projekt_w66952] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Projekt_w66952] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Projekt_w66952] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Projekt_w66952] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Projekt_w66952] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Projekt_w66952] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Projekt_w66952] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Projekt_w66952] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Projekt_w66952] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Projekt_w66952] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Projekt_w66952] SET RECOVERY FULL 
GO
ALTER DATABASE [Projekt_w66952] SET  MULTI_USER 
GO
ALTER DATABASE [Projekt_w66952] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Projekt_w66952] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Projekt_w66952] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Projekt_w66952] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Projekt_w66952] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Projekt_w66952', N'ON'
GO
ALTER DATABASE [Projekt_w66952] SET QUERY_STORE = OFF
GO
USE [Projekt_w66952]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] NOT NULL,
	[email] [varchar](128) NOT NULL,
	[phone] [varchar](16) NULL,
	[mobile] [varchar](16) NULL,
	[status] [int] NOT NULL,
	[first_name] [varchar](64) NULL,
	[last_name] [varchar](64) NULL,
	[pesel] [char](11) NULL,
	[birth_date] [date] NULL,
	[home_address] [int] NOT NULL,
	[register_date] [date] NULL,
 CONSTRAINT [users_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[get_user_by_id]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[get_user_by_id](@id INTEGER)
RETURNS TABLE
AS
RETURN
    SELECT * FROM users
    WHERE id = @id;
GO
/****** Object:  Table [dbo].[address]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[id] [int] NOT NULL,
	[street] [varchar](64) NULL,
	[house_number] [varchar](10) NOT NULL,
	[flat_number] [varchar](10) NULL,
	[town] [varchar](64) NOT NULL,
	[postal_code] [varchar](6) NOT NULL,
	[post_office] [varchar](64) NOT NULL,
 CONSTRAINT [address_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cars]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cars](
	[id] [int] NOT NULL,
	[registration_number] [varchar](7) NOT NULL,
	[brand] [varchar](50) NOT NULL,
	[model] [varchar](50) NOT NULL,
	[colour] [varchar](50) NOT NULL,
	[year] [int] NOT NULL,
	[insurance_date] [date] NULL,
	[examination_date] [date] NULL,
	[category] [varchar](4) NULL,
	[disctance] [int] NULL,
 CONSTRAINT [cars_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[category_code] [varchar](4) NOT NULL,
	[category_name] [varchar](1) NOT NULL,
 CONSTRAINT [categories_pk] PRIMARY KEY CLUSTERED 
(
	[category_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classrom]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classrom](
	[id] [int] NOT NULL,
	[description] [varchar](512) NULL,
	[capacity] [int] NULL,
 CONSTRAINT [Classrom_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[id] [int] NOT NULL,
	[start_date] [date] NOT NULL,
	[type] [varchar](3) NOT NULL,
	[practical_training] [int] NOT NULL,
	[theoretical_training] [int] NOT NULL,
 CONSTRAINT [courses_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[driving_lessons]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[driving_lessons](
	[id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[instructor_id] [int] NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[course_id] [int] NOT NULL,
	[status] [int] NOT NULL,
	[distance] [int] NULL,
	[car_id] [int] NOT NULL,
 CONSTRAINT [driving_lessons_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[id] [int] NOT NULL,
	[nip] [varchar](13) NULL,
	[account_number] [varchar](34) NULL,
 CONSTRAINT [employees_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instructors]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructors](
	[user_id] [int] NOT NULL,
 CONSTRAINT [instructors_pk] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[internal_exams]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[internal_exams](
	[id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[type] [char](1) NOT NULL,
	[result] [char](1) NOT NULL,
	[errors] [varchar](500) NULL,
	[date] [date] NOT NULL,
	[instructor] [int] NOT NULL,
 CONSTRAINT [internal_exams_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[student_id] ASC,
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payments]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payments](
	[id] [int] NOT NULL,
	[amount] [numeric](9, 2) NOT NULL,
	[date] [date] NOT NULL,
	[student_id] [int] NOT NULL,
	[accepted_by] [int] NOT NULL,
	[status] [int] NOT NULL,
	[due_date] [date] NULL,
	[description] [varchar](64) NULL,
 CONSTRAINT [payments_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payments_status]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payments_status](
	[id] [int] NOT NULL,
	[description] [varchar](200) NOT NULL,
 CONSTRAINT [payments_status_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] NOT NULL,
	[name] [varchar](100) NULL,
 CONSTRAINT [status_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_categories]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_categories](
	[student_id] [int] NOT NULL,
	[category_code] [varchar](4) NOT NULL,
 CONSTRAINT [student_categories_pk] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC,
	[category_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_courses]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_courses](
	[course_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[medical_certificate] [varchar](4) NULL,
	[instructor] [int] NULL,
	[certificate_number] [varchar](10) NULL,
	[end_date] [date] NULL,
 CONSTRAINT [student_courses_pk] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC,
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[user_id] [int] NOT NULL,
 CONSTRAINT [students_pk] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[theoretical_lessons]    Script Date: 10.01.2023 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[theoretical_lessons](
	[id] [int] NOT NULL,
	[course_id] [int] NULL,
	[instuctor_id] [int] NULL,
	[subject] [varchar](200) NULL,
	[date] [date] NOT NULL,
	[hours] [int] NOT NULL,
	[class] [int] NULL,
 CONSTRAINT [theoretical_lessons_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cars]  WITH CHECK ADD  CONSTRAINT [cars_category_fk] FOREIGN KEY([category])
REFERENCES [dbo].[categories] ([category_code])
GO
ALTER TABLE [dbo].[cars] CHECK CONSTRAINT [cars_category_fk]
GO
ALTER TABLE [dbo].[driving_lessons]  WITH CHECK ADD  CONSTRAINT [driving_lessons_car_id_fk] FOREIGN KEY([car_id])
REFERENCES [dbo].[cars] ([id])
GO
ALTER TABLE [dbo].[driving_lessons] CHECK CONSTRAINT [driving_lessons_car_id_fk]
GO
ALTER TABLE [dbo].[driving_lessons]  WITH CHECK ADD  CONSTRAINT [driving_lessons_course_id_fk] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[driving_lessons] CHECK CONSTRAINT [driving_lessons_course_id_fk]
GO
ALTER TABLE [dbo].[driving_lessons]  WITH CHECK ADD  CONSTRAINT [driving_lessons_instructor_id_fk] FOREIGN KEY([instructor_id])
REFERENCES [dbo].[instructors] ([user_id])
GO
ALTER TABLE [dbo].[driving_lessons] CHECK CONSTRAINT [driving_lessons_instructor_id_fk]
GO
ALTER TABLE [dbo].[driving_lessons]  WITH CHECK ADD  CONSTRAINT [driving_lessons_status_fk] FOREIGN KEY([status])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[driving_lessons] CHECK CONSTRAINT [driving_lessons_status_fk]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [employees__id_fk] FOREIGN KEY([id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [employees__id_fk]
GO
ALTER TABLE [dbo].[instructors]  WITH CHECK ADD  CONSTRAINT [instructors_employes_id_pk] FOREIGN KEY([user_id])
REFERENCES [dbo].[employees] ([id])
GO
ALTER TABLE [dbo].[instructors] CHECK CONSTRAINT [instructors_employes_id_pk]
GO
ALTER TABLE [dbo].[internal_exams]  WITH CHECK ADD  CONSTRAINT [internal_exams_instructor_fk] FOREIGN KEY([instructor])
REFERENCES [dbo].[instructors] ([user_id])
GO
ALTER TABLE [dbo].[internal_exams] CHECK CONSTRAINT [internal_exams_instructor_fk]
GO
ALTER TABLE [dbo].[payments]  WITH CHECK ADD  CONSTRAINT [payments_status_fk] FOREIGN KEY([status])
REFERENCES [dbo].[payments_status] ([id])
GO
ALTER TABLE [dbo].[payments] CHECK CONSTRAINT [payments_status_fk]
GO
ALTER TABLE [dbo].[payments]  WITH CHECK ADD  CONSTRAINT [payments_student_id_fk] FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([user_id])
GO
ALTER TABLE [dbo].[payments] CHECK CONSTRAINT [payments_student_id_fk]
GO
ALTER TABLE [dbo].[student_categories]  WITH CHECK ADD  CONSTRAINT [student_categories_category_code_fk] FOREIGN KEY([category_code])
REFERENCES [dbo].[categories] ([category_code])
GO
ALTER TABLE [dbo].[student_categories] CHECK CONSTRAINT [student_categories_category_code_fk]
GO
ALTER TABLE [dbo].[student_categories]  WITH CHECK ADD  CONSTRAINT [student_categories_student_id_fk] FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([user_id])
GO
ALTER TABLE [dbo].[student_categories] CHECK CONSTRAINT [student_categories_student_id_fk]
GO
ALTER TABLE [dbo].[student_courses]  WITH CHECK ADD  CONSTRAINT [student_courses_course_id_fk] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[student_courses] CHECK CONSTRAINT [student_courses_course_id_fk]
GO
ALTER TABLE [dbo].[student_courses]  WITH CHECK ADD  CONSTRAINT [student_courses_instructor_fk] FOREIGN KEY([instructor])
REFERENCES [dbo].[instructors] ([user_id])
GO
ALTER TABLE [dbo].[student_courses] CHECK CONSTRAINT [student_courses_instructor_fk]
GO
ALTER TABLE [dbo].[student_courses]  WITH CHECK ADD  CONSTRAINT [student_courses_student_id_fk] FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([user_id])
GO
ALTER TABLE [dbo].[student_courses] CHECK CONSTRAINT [student_courses_student_id_fk]
GO
ALTER TABLE [dbo].[student_courses]  WITH CHECK ADD  CONSTRAINT [student_courses_student_two_id_fk] FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([user_id])
GO
ALTER TABLE [dbo].[student_courses] CHECK CONSTRAINT [student_courses_student_two_id_fk]
GO
ALTER TABLE [dbo].[students]  WITH CHECK ADD  CONSTRAINT [students_user_id_fk] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[students] CHECK CONSTRAINT [students_user_id_fk]
GO
ALTER TABLE [dbo].[theoretical_lessons]  WITH CHECK ADD  CONSTRAINT [theoretical_lessons_course_id_fk] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[theoretical_lessons] CHECK CONSTRAINT [theoretical_lessons_course_id_fk]
GO
ALTER TABLE [dbo].[theoretical_lessons]  WITH CHECK ADD  CONSTRAINT [theoretical_lessons_id_fk] FOREIGN KEY([class])
REFERENCES [dbo].[Classrom] ([id])
GO
ALTER TABLE [dbo].[theoretical_lessons] CHECK CONSTRAINT [theoretical_lessons_id_fk]
GO
ALTER TABLE [dbo].[theoretical_lessons]  WITH CHECK ADD  CONSTRAINT [theoretical_lessons_instructor_id_fk] FOREIGN KEY([instuctor_id])
REFERENCES [dbo].[instructors] ([user_id])
GO
ALTER TABLE [dbo].[theoretical_lessons] CHECK CONSTRAINT [theoretical_lessons_instructor_id_fk]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [users_home_address_fk] FOREIGN KEY([home_address])
REFERENCES [dbo].[address] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [users_home_address_fk]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [users_mailing_address_fk] FOREIGN KEY([home_address])
REFERENCES [dbo].[address] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [users_mailing_address_fk]
GO
USE [master]
GO
ALTER DATABASE [Projekt_w66952] SET  READ_WRITE 
GO
