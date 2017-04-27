import Release from '../src/components/Release';
describe('Release', () => {
  let album_art_url,
      title,
      artist,
      wrapper;
beforeEach(() => {
    wrapper = mount(
      <Release
        album_art_url="http://fakeurl.com/elephant"
        artist="Hiromi"
        title="Voice"
      />
    );
  });
it('should render an img tag', () => {
    expect(wrapper.find('img')).toBePresent();
  });
it('should render a p tag with the artist name', () => {
    expect(wrapper.find('p').text()).toBe('Hiromi');
  });
it('should render an img tag with the specific props', () => {
    expect(wrapper.find('img').props()).toEqual({
      src: 'http://fakeurl.com/elephant',
      height: '500',
      width: '500'
    });
  });
});
