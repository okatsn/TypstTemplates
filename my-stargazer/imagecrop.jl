using OkImageCropper
using OkFiles
using YAML
using Pkg

dir_project(args...) = joinpath(Pkg.project().path |> dirname, args...)

stagekeys = YAML.load_file(dir_project("dvc.yaml"))["stages"]
# Extract dependencies from all `compile_slide*` stages
deps = [v["deps"] for (k, v) in pairs(stagekeys) if occursin(r"^compile_slide", k)] |> (x -> reduce(vcat, x)) |> unique

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
