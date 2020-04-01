def find_dpi(self, root):
    res = self.ext.GetScreenResources(root).reply()
    widthPX = 0
    heightPX = 0
    widthMM = 0
    heightMM = 0

    for crtc in res.crtcs:
        info = self.ext.GetCrtcInfo(crtc, xcffib.CurrentTime).reply()
        widthPX += info.width
        heightPX += info.height

    for output in res.outputs:
        info = self.ext.GetOutputInfo(output, xcffib.CurrentTime).reply()
        widthMM += info.mm_width
        heightMM += info.mm_height

    widthDPI = widthPX * 25.4 / widthMM
    heightDPI = heightPX * 25.4 / heightMM

    dpi = (widthDPI + heightDPI) / 2.0
    print(dpi)
    return dpi
