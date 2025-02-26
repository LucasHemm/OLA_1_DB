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
                    player_id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    username = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    email = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ranking = table.Column<int>(type: "int", nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Players", x => x.player_id);
                });

            migrationBuilder.CreateTable(
                name: "Tournaments",
                columns: table => new
                {
                    tournament_id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    game = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    max_players = table.Column<int>(type: "int", nullable: false),
                    start_date = table.Column<DateTime>(type: "datetime2", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Tournaments", x => x.tournament_id);
                });

            migrationBuilder.CreateTable(
                name: "Matches",
                columns: table => new
                {
                    match_id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    tournament_id = table.Column<int>(type: "int", nullable: false),
                    player1_id = table.Column<int>(type: "int", nullable: false),
                    player2_id = table.Column<int>(type: "int", nullable: false),
                    winner_id = table.Column<int>(type: "int", nullable: false),
                    match_date = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Matches", x => x.match_id);
                    table.ForeignKey(
                        name: "FK_Matches_Players_player1_id",
                        column: x => x.player1_id,
                        principalTable: "Players",
                        principalColumn: "player_id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Matches_Players_player2_id",
                        column: x => x.player2_id,
                        principalTable: "Players",
                        principalColumn: "player_id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Matches_Players_winner_id",
                        column: x => x.winner_id,
                        principalTable: "Players",
                        principalColumn: "player_id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Matches_Tournaments_tournament_id",
                        column: x => x.tournament_id,
                        principalTable: "Tournaments",
                        principalColumn: "tournament_id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "TournamentRegistrations",
                columns: table => new
                {
                    registration_id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    tournament_id = table.Column<int>(type: "int", nullable: false),
                    player_id = table.Column<int>(type: "int", nullable: false),
                    registered_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TournamentRegistrations", x => x.registration_id);
                    table.ForeignKey(
                        name: "FK_TournamentRegistrations_players_id",
                        column: x => x.player_id,
                        principalTable: "Players",
                        principalColumn: "player_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_TournamentRegistrations_Tournaments_tournament_id",
                        column: x => x.tournament_id,
                        principalTable: "Tournaments",
                        principalColumn: "tournament_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Matches_player1_id",
                table: "Matches",
                column: "player1_id");

            migrationBuilder.CreateIndex(
                name: "IX_Matches_player2_id",
                table: "Matches",
                column: "player2_id");

            migrationBuilder.CreateIndex(
                name: "IX_Matches_tournament_id",
                table: "Matches",
                column: "tournament_id");

            migrationBuilder.CreateIndex(
                name: "IX_Matches_winner_id",
                table: "Matches",
                column: "winner_id");

            migrationBuilder.CreateIndex(
                name: "IX_Players_email",
                table: "Players",
                column: "email",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Players_username",
                table: "Players",
                column: "username",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_TournamentRegistrations_player_id",
                table: "TournamentRegistrations",
                column: "player_id");

            migrationBuilder.CreateIndex(
                name: "IX_TournamentRegistrations_tournament_id",
                table: "TournamentRegistrations",
                column: "tournament_id");

            migrationBuilder.CreateIndex(
                name: "IX_tournaments_name",
                table: "Tournaments",
                column: "name",
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
