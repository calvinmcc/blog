require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'requires a title' do
      #GIVEN
        p = Post.new
      #WHEN
        p.valid?
      #THEN
        expect(p).to be_invalid
    end
    it 'requires a title longer than 7 characters' do
      #GIVEN
        p = Post.new(title: "sadf", body: "sadfasdfadfsadfsadfasdasdfsafd")
      #WHEN
        p.valid?
      #THEN
        expect(p).to be_invalid
    end
    it 'requires a body' do
      #GIVEN
        p = Post.new(title: "sadfasdfsa")
      #WHEN
        p.valid?
      #THEN
        expect(p).to be_invalid
    end
    it 'shows only 100 characters' do
      #GIVEN
        p = Post.new(title: 'asdfasadsa', body: 'sas;ldkajsd;lkfasjd;laksdjf;slakdjas;lfkdajsdf;lkasdjfas;lkdfjas;dlksajd;flaksjdfas;lkdfjas;ldkfjas;dlkfj;alskdfjas;dlkfajsdf;lkasdjf;asldkfjas;dlfkajsdf;alskdfjasd;lfksadjf;lkdjfas;dlfkjasdf;alskdfjsas;ldkajsd;lkfasjd;laksdjf;slakdjas;lfkdajsdf;lkasdjfas;lkdfjas;dlksajd;flaksjdfas;lkdfjas;ldkfjas;dlkfj;alskdfjas;dlkfajsdf;lkasdjf;asldkfjas;dlfkajsdf;alskdfjasd;lfksadjf;lkdjfas;dlfkjasdf;alskdfjsas;ldkajsd;lkfasjd;laksdjf;slakdjas;lfkdajsdf;lkasdjfas;lkdfjas;dlksajd;flaksjdfas;lkdfjas;ldkfjas;dlkfj;alskdfjas;dlkfajsdf;lkasdjf;asldkfjas;dlfkajsdf;alskdfjasd;lfksadjf;lkdjfas;dlfkjasdf;alskdfjsas;ldkajsd;lkfasjd;laksdjf;slakdjas;lfkdajsdf;lkasdjfas;lkdfjas;dlksajd;flaksjdfas;lkdfjas;ldkfjas;dlkfj;alskdfjas;dlkfajsdf;lkasdjf;asldkfjas;dlfkajsdf;alskdfjasd;lfksadjf;lkdjfas;dlfkjasdf;alskdfj')
      #WHEN
        p.valid?
      #THEN
        expect(p.body_snippet.size).to eq(100)
    end
end
end
