local newdecoder = require('plugins/lunajson/decoder')
local newencoder = require ( 'plugins/lunajson/encoder' )
local sax = require ( 'plugins/lunajson/sax' )
-- If you need multiple contexts of decoder and/or encoder,
-- you can require lunajson.decoder and/or lunajson.encoder directly.
return {
	decode = newdecoder(),
	encode = newencoder(),
	newparser = sax.newparser,
	newfileparser = sax.newfileparser,
}
