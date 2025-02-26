using Microsoft.AspNetCore.Mvc;
using OLA_1_DB.Facades;

namespace OLA_1_DB
{
    [ApiController]
    [Route("api/[controller]")]
    public class TournamentController : ControllerBase
    {
        private readonly TournamentFacade _tournamentFacade;

        public TournamentController(TournamentFacade tournamentFacade)
        {
            _tournamentFacade = tournamentFacade;
        }

        // POST: api/tournament/join
        [HttpPost("join")]
        public async Task<IActionResult> JoinTournament([FromBody] JoinTournamentRequest request)
        {
            await _tournamentFacade.JoinTournamentAsync(request.TournamentId, request.PlayerId);
            return Ok(new { message = "Tournament joined successfully." });
        }

        // POST: api/tournament/submit-result
        [HttpPost("submit-result")]
        public async Task<IActionResult> SubmitMatchResult([FromBody] SubmitMatchResultRequest request)
        {
            await _tournamentFacade.SubmitMatchResultAsync(
                request.TournamentId, 
                request.Player1Id, 
                request.Player2Id, 
                request.WinnerId, 
                request.MatchDate);
            return Ok(new { message = "Match result submitted successfully." });
        }
    }

    // Request model for joining a tournament
    public class JoinTournamentRequest
    {
        public int TournamentId { get; set; }
        public int PlayerId { get; set; }
    }

    // Request model for submitting a match result
    public class SubmitMatchResultRequest
    {
        public int TournamentId { get; set; }
        public int Player1Id { get; set; }
        public int Player2Id { get; set; }
        public int WinnerId { get; set; }
        public DateTime MatchDate { get; set; }
    }
}