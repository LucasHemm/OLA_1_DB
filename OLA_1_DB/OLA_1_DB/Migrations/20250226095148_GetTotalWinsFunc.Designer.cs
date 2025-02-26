﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace OLA_1_DB.Migrations
{
    [DbContext(typeof(ApplicationDbContext))]
    [Migration("20250226095148_GetTotalWinsFunc")]
    partial class GetTotalWinsFunc
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "9.0.2")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("OLA_1_DB.Entities.Match", b =>
                {
                    b.Property<int>("Match_Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Match_Id"));

                    b.Property<DateTime>("Match_Date")
                        .HasColumnType("datetime2");

                    b.Property<int>("Player1_Player_Id")
                        .HasColumnType("int");

                    b.Property<int>("Player2_Player_Id")
                        .HasColumnType("int");

                    b.Property<int>("Tournament_Id")
                        .HasColumnType("int");

                    b.Property<int>("Winner_Player_Id")
                        .HasColumnType("int");

                    b.HasKey("Match_Id");

                    b.HasIndex("Player1_Player_Id");

                    b.HasIndex("Player2_Player_Id");

                    b.HasIndex("Tournament_Id");

                    b.HasIndex("Winner_Player_Id");

                    b.ToTable("Matches");
                });

            modelBuilder.Entity("OLA_1_DB.Entities.Player", b =>
                {
                    b.Property<int>("Player_Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Player_Id"));

                    b.Property<DateTime>("Created_At")
                        .HasColumnType("datetime2");

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.Property<int>("Ranking")
                        .HasColumnType("int");

                    b.Property<string>("Username")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.HasKey("Player_Id");

                    b.HasIndex("Email")
                        .IsUnique();

                    b.HasIndex("Username")
                        .IsUnique();

                    b.ToTable("Players");
                });

            modelBuilder.Entity("OLA_1_DB.Entities.Tournament", b =>
                {
                    b.Property<int>("Tournament_Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Tournament_Id"));

                    b.Property<DateTime>("Created_At")
                        .HasColumnType("datetime2");

                    b.Property<string>("Game")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("Max_Players")
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.Property<DateTime>("Start_Date")
                        .HasColumnType("datetime2");

                    b.HasKey("Tournament_Id");

                    b.HasIndex("Name")
                        .IsUnique();

                    b.ToTable("Tournaments");
                });

            modelBuilder.Entity("OLA_1_DB.Entities.TournamentRegistration", b =>
                {
                    b.Property<int>("TournamentRegistration_Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("TournamentRegistration_Id"));

                    b.Property<int>("Player_Id")
                        .HasColumnType("int");

                    b.Property<DateTime>("Registered_At")
                        .HasColumnType("datetime2");

                    b.Property<int>("Tournament_Id")
                        .HasColumnType("int");

                    b.HasKey("TournamentRegistration_Id");

                    b.HasIndex("Player_Id");

                    b.HasIndex("Tournament_Id");

                    b.ToTable("TournamentRegistrations");
                });

            modelBuilder.Entity("OLA_1_DB.Entities.Match", b =>
                {
                    b.HasOne("OLA_1_DB.Entities.Player", "Player1_")
                        .WithMany("MatchesAsPlayer1")
                        .HasForeignKey("Player1_Player_Id")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("OLA_1_DB.Entities.Player", "Player2_")
                        .WithMany("MatchesAsPlayer2")
                        .HasForeignKey("Player2_Player_Id")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("OLA_1_DB.Entities.Tournament", "Tournament_")
                        .WithMany("Matches")
                        .HasForeignKey("Tournament_Id")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("OLA_1_DB.Entities.Player", "Winner_")
                        .WithMany("MatchesWon")
                        .HasForeignKey("Winner_Player_Id")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.Navigation("Player1_");

                    b.Navigation("Player2_");

                    b.Navigation("Tournament_");

                    b.Navigation("Winner_");
                });

            modelBuilder.Entity("OLA_1_DB.Entities.TournamentRegistration", b =>
                {
                    b.HasOne("OLA_1_DB.Entities.Player", "Player_")
                        .WithMany()
                        .HasForeignKey("Player_Id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("OLA_1_DB.Entities.Tournament", "Tournament_")
                        .WithMany()
                        .HasForeignKey("Tournament_Id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Player_");

                    b.Navigation("Tournament_");
                });

            modelBuilder.Entity("OLA_1_DB.Entities.Player", b =>
                {
                    b.Navigation("MatchesAsPlayer1");

                    b.Navigation("MatchesAsPlayer2");

                    b.Navigation("MatchesWon");
                });

            modelBuilder.Entity("OLA_1_DB.Entities.Tournament", b =>
                {
                    b.Navigation("Matches");
                });
#pragma warning restore 612, 618
        }
    }
}
