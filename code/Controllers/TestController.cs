using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

[ApiController]
[Route("[controller]")]
public class TestController : ControllerBase
{
    private readonly IConfiguration _configuration;

    public TestController(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    [HttpGet("config")]
    public IActionResult GetConfigValue([FromQuery] string key)
    {
        var value = _configuration[key];
        return Ok(new { Key = key, Value = value });
    }

    [HttpGet]
    public IActionResult Get()
    {
        return Ok("AKS Test Application is running!");
    }
}
