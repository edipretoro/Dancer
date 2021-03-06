use Test::More import => ['!pass'];
use lib 't';
use TestUtils;

my @methods = qw(get head put post);
plan tests => scalar(@methods) + 3;

use Dancer;

ok(get('/', sub { 'get' }), "GET / defined ");
ok(post('/', sub { 'post' }), "POST / defined ");
ok(put('/', sub { 'put' }), "PUT / defined ");

foreach my $m (@methods) {
    my $cgi = TestUtils::fake_request($m => '/');
    Dancer::SharedData->cgi($cgi);
    my $response = Dancer::Renderer::get_action_response();
    ok(defined($response), "route handler found for method $m");
}
