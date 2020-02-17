package greeting

import "testing"

func TestHello(t *testing.T) {
	got := Hello()
	want := "Hello, Go!"

	if got != want {
		t.Errorf("got %q want %q", got, want)
	}
}
