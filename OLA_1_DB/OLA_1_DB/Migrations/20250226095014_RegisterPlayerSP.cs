using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace OLA_1_DB.Migrations
{
    /// <inheritdoc />
    public partial class RegisterPlayerSP : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql(@"CREATE PROCEDURE registerPlayer
            @username VARCHAR(255),
            @email VARCHAR(255),
            @ranking INT = NULL
            AS
                BEGIN
            SET NOCOUNT ON;
            INSERT INTO Players (username, email, ranking, created_at)
            VALUES (@username, @email, @ranking, GETDATE());
            END;
                ");

        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {

            migrationBuilder.Sql(@"DROP PROCEDURE registerPlayer");
        }
    }
}
