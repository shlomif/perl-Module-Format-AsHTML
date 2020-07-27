package Module::Format::AsHTML;

use strict;
use warnings;

use Moo;

sub dist
{
    my ( $self, $args ) = @_;
    return
        qq#<a href="http://metacpan.org/release/$args->{d}">$args->{body}</a>#;
}

sub homepage
{
    my ( $self, $args ) = @_;
    return qq#http://metacpan.org/author/\U$args->{who}\E#;
}

sub mod_
{
    my ( $self, $args ) = @_;
    return
        qq#<a href="http://metacpan.org/module/$args->{m}">$args->{body}</a>#;
}

sub module
{
    my ( $self, $args ) = @_;
    return $self->mod_($args);
}

sub b_self_dist
{
    my ( $self, $args ) = @_;
    return $self->dist( { body => "<b>$args->{d}</b>", %$args, } );
}

sub self_dist
{
    my ( $self, $args ) = @_;
    return $self->dist( { body => $args->{d}, %$args, } );
}

sub self_mod
{
    my ( $self, $args ) = @_;
    return $self->mod_( { body => $args->{'m'}, %$args, } );
}

1;

__END__

=head1 NAME

Module::Format::AsHTML - generate HTML links to metacpan module/dists pages.

=head1 SYNOPSIS

    use Module::Format::AsHTML ();
    my $cpan = Module::Format::AsHTML->new();

    $html .= $cpan->self_mod({ 'm'=> "Path::Tiny"});

=head1 METHODS

=head2 my $cpan = Module::Format::AsHTML->new()

Returns a new object.

=head2 $cpan->b_self_dist({d=>"Path-Tiny"})

Returns a link to 'd' with bolded text.

=head2 $cpan->self_dist({d=>"Path-Tiny"})

Returns a link to 'd' with its text defaulting to its name.

=head2 $cpan->dist({d=>"Path-Tiny", body=>"$html"})

Returns a link to 'd' with the text 'body'.

=head2 $cpan->homepage({'who'=>"SHLOMIF"})

Homepage url to 'who'.

=head2 $cpan->module ({'m'=>"List::Util", body=>"$html"})

Returns a link to 'm' with the text 'body'. (aliased for tt2/etc. friendliness).

=head2 $cpan->self_mod ({'m'=>"Path::Tiny"})

Returns a link to 'm' with its text defaulting to its name.

=head2 $cpan->mod_ ({"m"=>"List::Util", body=>"$html"})

Returns a link to 'm' with the text 'body'. (aliased for tt2/etc. friendliness).

=cut
