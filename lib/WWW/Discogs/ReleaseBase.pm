package WWW::Discogs::ReleaseBase;

use strict;
use warnings;
use Carp;

sub new {
    my ($class, @args) = @_;

    croak "Can't create abstract object WWW::Discogs::ReleaseBase"
        if $class eq __PACKAGE__;
}

sub _init {
    my ($self, %args) = @_;

    $self->{_id}           = $args{id}           || '';
    $self->{_year}         = $args{year}         || '';
    $self->{_notes}        = $args{notes}        || '';
    $self->{_styles}       = $args{styles}       || [];
    $self->{_genres}       = $args{genres}       || [];
    $self->{_images}       = $args{images}       || [];
    $self->{_artists}      = $args{artists}      || [];
    $self->{_extraartists} = $args{extraartists} || [];
    $self->{_tracklist}    = $args{tracklist}    || [];
    $self->{_params}       = $args{_params}      || {};
    $self->{_uri}          = $args{_uri}         || '';

    return $self;
}

sub id {
    my $self = shift;
    return $self->{_id};
}

sub year {
    my $self = shift;
    return $self->{_year};
}

sub notes {
    my $self = shift;
    return $self->{_notes};
}

sub styles {
    my $self = shift;
    return @{ $self->{_styles} };
}

sub genres {
    my $self = shift;
    return @{ $self->{_genres} };
}

sub images {
    my ($self, %args) = @_;
    my $image_type = $args{type};

    if ($image_type) {
        return grep { $_->type =~ /^${image_type}$/i } @{ $self->{_images} };
    }

    return @{ $self->{_images} };
}

sub artists {
    my $self = shift;
    return @{ $self->{_artists} };
}

sub extraartists {
    my $self = shift;
    return @{ $self->{_extraartists} };
}

sub tracklist {
    # implement in inheriting classes
    croak "Abstract method 'tracklist' called";
}

1;
