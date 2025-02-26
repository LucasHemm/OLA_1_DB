using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace OLA_1_DB.Migrations
{
    /// <inheritdoc />
    public partial class Initial : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Players",
                columns: table => new
                {
                    Player_Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Username = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Ranking = table.Column<int>(type: "int", nullable: false),
                    Created_At = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Players", x => x.Player_Id);
                });

            migrationBuilder.CreateTable(
                name: "Tournaments",
                columns: table => new
                {
                    Tournament_Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Game = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Max_Players = table.Column<int>(type: "int", nullable: false),
                    Start_Date = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Created_At = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Tournaments", x => x.Tournament_Id);
                });

            migrationBuilder.CreateTable(
                name: "Matches",
                columns: table => new
                {
                    Match_Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Tournament_Id = table.Column<int>(type: "int", nullable: false),
                    Player1_Player_Id = table.Column<int>(type: "int", nullable: false),
                    Player2_Player_Id = table.Column<int>(type: "int", nullable: false),
                    Winner_Player_Id = table.Column<int>(type: "int", nullable: false),
                    Match_Date = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Matches", x => x.Match_Id);
                    table.ForeignKey(
                        name: "FK_Matches_Players_Player1_Player_Id",
                        column: x => x.Player1_Player_Id,
                        principalTable: "Players",
                        principalColumn: "Player_Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Matches_Players_Player2_Player_Id",
                        column: x => x.Player2_Player_Id,
                        principalTable: "Players",
                        principalColumn: "Player_Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Matches_Players_Winner_Player_Id",
                        column: x => x.Winner_Player_Id,
                        principalTable: "Players",
                        principalColumn: "Player_Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Matches_Tournaments_Tournament_Id",
                        column: x => x.Tournament_Id,
                        principalTable: "Tournaments",
                        principalColumn: "Tournament_Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "TournamentRegistrations",
                columns: table => new
                {
                    TournamentRegistration_Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Tournament_Id = table.Column<int>(type: "int", nullable: false),
                    Player_Id = table.Column<int>(type: "int", nullable: false),
                    Registered_At = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TournamentRegistrations", x => x.TournamentRegistration_Id);
                    table.ForeignKey(
                        name: "FK_TournamentRegistrations_Players_Player_Id",
                        column: x => x.Player_Id,
                        principalTable: "Players",
                        principalColumn: "Player_Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_TournamentRegistrations_Tournaments_Tournament_Id",
                        column: x => x.Tournament_Id,
                        principalTable: "Tournaments",
                        principalColumn: "Tournament_Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Matches_Player1_Player_Id",
                table: "Matches",
                column: "Player1_Player_Id");

            migrationBuilder.CreateIndex(
                name: "IX_Matches_Player2_Player_Id",
                table: "Matches",
                column: "Player2_Player_Id");

            migrationBuilder.CreateIndex(
                name: "IX_Matches_Tournament_Id",
                table: "Matches",
                column: "Tournament_Id");

            migrationBuilder.CreateIndex(
                name: "IX_Matches_Winner_Player_Id",
                table: "Matches",
                column: "Winner_Player_Id");

            migrationBuilder.CreateIndex(
                name: "IX_Players_Email",
                table: "Players",
                column: "Email",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Players_Username",
                table: "Players",
                column: "Username",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_TournamentRegistrations_Player_Id",
                table: "TournamentRegistrations",
                column: "Player_Id");

            migrationBuilder.CreateIndex(
                name: "IX_TournamentRegistrations_Tournament_Id",
                table: "TournamentRegistrations",
                column: "Tournament_Id");

            migrationBuilder.CreateIndex(
                name: "IX_Tournaments_Name",
                table: "Tournaments",
                column: "Name",
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Matches");

            migrationBuilder.DropTable(
                name: "TournamentRegistrations");

            migrationBuilder.DropTable(
                name: "Players");

            migrationBuilder.DropTable(
                name: "Tournaments");
        }
    }
}
