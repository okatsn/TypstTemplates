using OkImageCropper
using OkFiles
using YAML
using Pkg

dir_project(args...) = joinpath(Pkg.project().path |> dirname, args...)

image_crop_compile = YAML.load_file(dir_project("dvc.yaml"))["stages"]["compile_slide"]

deps = image_crop_compile["deps"]
depdir = isdir.(dir_project.(deps))
depfile = .!depdir
imgfile = occursin.(r"\.(png|jpg|jpeg|svg|bmp)\Z", deps)
targetdirs = deps[depdir]
targetfiles = deps[depfile.&&imgfile]


target1 = dir_project.(targetfiles)
target2 = reduce(vcat, filelistall.(r".*\.png\Z", dir_project.(targetdirs)))
targets = vcat(target1, target2)
for t in targets
    # t = targets[2]
    crop_whitespace(t, t; padding=10)
end
