package Flashback;
use Dancer2;

our $VERSION = '0.1';

hook 'before' => sub {
    # If user is not logged in, redirect to the login page
    if (!session('user') && request->path_info !~ m{^/(auth|js|css|images|favicon.ico|robots.txt)}) {
        status 401; # Not authorized
        forward '/auth', { continue => request->path_info };
    }
};

get '/' => sub {
    template 'index';
};

get '/auth' => sub {
    template 'auth';
};

true;
