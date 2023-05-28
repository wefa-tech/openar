/*
Prepare your Model as gltf/glb and put it in project folder, "cd" to folder
Model Group and Animation Intregration: Auto-generated by: https://github.com/pmndrs/gltfjsx
Command: npx gltfjsx Kugelmonster3.glb --transform
-> copy jsx, rename it, check pathes and adapt to your requirements, 
-> copy transformed glb from root to public  
*/

import { useRef, useEffect, useMemo } from "react";
import { useGLTF, useAnimations, useTexture } from "@react-three/drei";
import { useGraph } from "@react-three/fiber";
import { DoubleSide } from 'three'
import * as SkeletonUtils from 'three/addons/utils/SkeletonUtils.js';

useTexture.preload('/RolyPolyTicTacToeTextureRGB.jpg')

export default function RolypolyTicTacToe(props:any) {

    /**
     * Model Loading
     */
    const group = useRef();
    const { scene, animations } = useGLTF("/RolypolyTicTacToe-transformed.glb") as any;
    const clone = useMemo(() => SkeletonUtils.clone(scene), [scene])
    const { nodes } = useGraph(clone) as any
    // const { actions } = useAnimations(animations, group)

    const shadowTexture = useTexture('/RolyPolyTicTacToeTextureRGB.jpg')
    shadowTexture.flipY = false  
    
    /**
     * Texture Loading
     */
    // const bakedTexture = useLoader(TextureLoader, './Rolypoly/rolypolyEyeRGB.png')
    // bakedTexture.flipY = false  // Texture looks weired: Flip y
    
    /**
     * Load Animations (Autocode - name changed)
     */
    const animationsToPlay = useAnimations(animations, group);
    console.log(animationsToPlay) // Control what is loaded
    /**
     * Prepare Graphical User Interface - Leva
     */
    //
    const animeRolyPoly = animationsToPlay.names[0]
    //
    // Prepare listener to user changes GUI
    // (& Play animation on first render)
    //
    useEffect(() => 
    {
        const action = animationsToPlay.actions[animeRolyPoly]
        action?.reset()        // Tweak Transition between Animations (can be done in Blender also)
                .fadeIn(0.5)    // -> starting smooth
                .play()         // -> play 

        return () =>            // return will be called on dispose or rerender (in useEffect)
        {                       
            action?.fadeOut(0.5) // -> ending smooth
        }
    }, [props.animation || animeRolyPoly])

    const headColorRoly='#2eba4c'
    const bodyColorRoly='#0076d7'
    const armsLegsColorRoly= "#2eba4c"
    const glowRoly=2
    const opacityRoly=0.6
    
    return (
    <>    
        <group ref={group} {...props} dispose={null}>
            <group name="Scene">
                <group name="root">
                <primitive object={nodes.root_1} />
                <skinnedMesh name="antennasTop" geometry={nodes.antennasTop.geometry} skeleton={nodes.antennasTop.skeleton} >
                    <meshBasicMaterial 
                        map={shadowTexture} 
                        side={ DoubleSide } color={ [ 0.5, 1,  0.5 * glowRoly ] } toneMapped={ false }
                    />
                </skinnedMesh>
                <skinnedMesh name="body" geometry={nodes.body.geometry} skeleton={nodes.body.skeleton} >
                    <meshBasicMaterial 
                        map={shadowTexture} 
                        side={ DoubleSide } color={ [ 1, 2,  1 * glowRoly ] } toneMapped={ false }
                    />
                </skinnedMesh>
                <skinnedMesh name="eyes" geometry={nodes.eyes.geometry} skeleton={nodes.eyes.skeleton} >
                    <meshBasicMaterial 
                        map={shadowTexture} 
                        side={ DoubleSide } color={ headColorRoly } toneMapped={ false }
                    />
                </skinnedMesh>
                <skinnedMesh name="head" geometry={nodes.head.geometry} skeleton={nodes.head.skeleton} >
                    <meshBasicMaterial 
                        map={shadowTexture}
                        side={ DoubleSide } color={ armsLegsColorRoly } toneMapped={ false } 
                    />
                </skinnedMesh>
                <skinnedMesh name="legs" geometry={nodes.legs.geometry} skeleton={nodes.legs.skeleton} >
                    <meshBasicMaterial 
                        map={shadowTexture}
                        side={ DoubleSide } color={ armsLegsColorRoly } toneMapped={ false } 
                    />
                </skinnedMesh>
                <skinnedMesh name="shield" geometry={nodes.shield.geometry} skeleton={nodes.shield.skeleton} >
                    <meshBasicMaterial 
                        map={shadowTexture}  
                        side={ DoubleSide } color={ bodyColorRoly } transparent={ true } opacity={ opacityRoly }
                    />
                </skinnedMesh>
                  
                </group>
            </group>
        </group>
    </>
    );
}
useGLTF.preload("/RolypolyTicTacToe-transformed.glb");