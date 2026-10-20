# Generator Modul Ajar Pembelajaran Mendalam

Aplikasi web statis (satu file `index.html`) + Supabase (login, simpan modul, AI lewat Edge Function).

## Langkah online
1. **Supabase**: buat project, buka SQL Editor, jalankan `schema.sql`.
2. **Auth**: Authentication > Providers > Email aktif (matikan "Confirm email" bila ingin langsung masuk).
3. **Edge Function** (butuh Supabase CLI):
   ```
   supabase login
   supabase link --project-ref <REF_PROJECT>
   supabase secrets set ANTHROPIC_API_KEY=sk-ant-xxxx
   supabase functions deploy generate-modul
   ```
   API key AI hanya tersimpan di server Supabase, tidak ada di GitHub/browser.
4. **index.html**: isi `CFG.URL` (https://<REF>.supabase.co) dan `CFG.KEY` (anon public key).
5. **GitHub Pages**: upload semua file ke repo > Settings > Pages > Deploy from branch `main` / root.
6. Supabase > Authentication > URL Configuration: isi Site URL dengan alamat GitHub Pages Anda.

Catatan: anon key memang aman di sisi klien (data dilindungi RLS). Fitur AI memakai kuota API Anda, jadi untuk membatasi pemakaian, nonaktifkan pendaftaran publik di Supabase.
