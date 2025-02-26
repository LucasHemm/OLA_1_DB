using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace OLA_1_DB.Migrations
{
    /// <inheritdoc />
    public partial class SubmitMatchResultSP : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql(@"REATE PROCEDURE submitMatchResult
    @tournament_id INT,
    @player1_id INT,
    @player2_id INT,
    @winner_id INT,
    @match_date DATETIME
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Matches (tournament_id, player1_id, player2_id, winner_id, match_date)
    VALUES (@tournament_id, @player1_id, @player2_id, @winner_id, @match_date);
END;

                ");

        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
                
                migrationBuilder.Sql(@"DROP PROCEDURE submitMatchResult");
        }
    }
}
